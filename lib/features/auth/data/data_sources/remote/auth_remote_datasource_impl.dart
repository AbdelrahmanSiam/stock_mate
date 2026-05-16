import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/features/auth/data/data_sources/remote/auth_remote_datasource.dart';
import 'package:stock_mate/features/auth/data/models/user_model.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRemoteDatasourceImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      print('1- Start Google Sign In');

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      print('2- Google User: $googleUser');

      if (googleUser == null) {
        throw FirebaseAuthException(
          code: 'google-sign-in-cancelled',
          message: 'Google sign in cancelled',
        );
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      print('3- Access Token: ${googleAuth.accessToken}');
      print('4- ID Token: ${googleAuth.idToken}');

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      print('5- Firebase Credential Created');

      final userCredential = await firebaseAuth.signInWithCredential(
        credential,
      );

      print('6- Firebase Login Success');

      print('UID: ${userCredential.user?.uid}');
      print('Email: ${userCredential.user?.email}');

      return UserModel.fromFirebase(userCredential.user!);
    } catch (e, stackTrace) {
      print('GOOGLE SIGN IN ERROR: $e');
      print(stackTrace);

      rethrow;
    }
  }

  @override
  Future<bool> checkEmailVerified() async {
    await firebaseAuth.currentUser?.reload();
    return firebaseAuth.currentUser?.emailVerified ?? false;
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return UserModel.fromFirebase(userCredential.user!);
  }

  @override
  Future<UserModel> register({
    required String email,
    required String password,
    required String displayName,
    required String shopName,
  }) async {
    final UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    await userCredential.user!.updateDisplayName(displayName);
    //  Save shopName in Firestore
    final UserModel userModel = UserModel.fromFirebase(
      userCredential.user!,
      shopName: shopName,
    );
    await FirebaseFirestore.instance
        .collection(kUsersCollection)
        .doc(userCredential.user!.uid)
        .set(userModel.toFirebase());
    await userCredential.user!.sendEmailVerification();
    return UserModel.fromFirebase(userCredential.user!, shopName: shopName);
  }

  @override
  Future<void> sendEmailVerification() async {
    await firebaseAuth.currentUser
        ?.reload(); // to ensure from last reload state
    await firebaseAuth.currentUser?.sendEmailVerification();
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Stream<UserModel?> getCurrentUser() {
    final user = firebaseAuth.currentUser;
    if (user == null) return Stream.value(null);
    return FirebaseFirestore.instance
        .collection(kUsersCollection)
        .doc(user.uid)
        .snapshots()
        .map((doc) {
          if (doc.exists) {
            return UserModel.fromFirestore(doc.data()!);
          } else {
            return UserModel.fromFirebase(user);
          }
        });
  }
}
