import 'package:firebase_auth/firebase_auth.dart';
import 'package:stock_mate/features/auth/data/data_sources/remote/auth_remote_datasource.dart';
import 'package:stock_mate/features/auth/data/models/user_model.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDatasourceImpl({required this.firebaseAuth});
  @override
  Future<bool> checkEmailVerified() async {
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
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<UserModel> register({
    required String email,
    required String password,
    required String displayName,
  }) async {
    final UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    await userCredential.user!.updateDisplayName(displayName);
    await userCredential.user!.sendEmailVerification();
    return UserModel.fromFirebase(userCredential.user!);
  }

  @override
  Future<void> sendEmailVerification() async {
    await firebaseAuth.currentUser?.reload(); // to ensure from last reload state
    await firebaseAuth.currentUser?.sendEmailVerification();
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
