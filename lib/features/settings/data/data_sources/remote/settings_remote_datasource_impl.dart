import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/features/settings/data/data_sources/remote/settings_remote_datasource.dart';
import 'package:stock_mate/features/settings/data/models/settings_user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;
import 'package:uuid/uuid.dart';

class SettingsRemoteDatasourceImpl implements SettingsRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  final SupabaseClient supabase;
  final GoogleSignIn googleSignIn;

  SettingsRemoteDatasourceImpl({
    required this.firestore,
    required this.firebaseAuth,
    required this.supabase,
    required this.googleSignIn,
  });
  @override
  Future<SettingsUserModel> getUserData() async {
    final User? user = firebaseAuth.currentUser;
    if (user == null) throw Exception('No user logged in');
    final DocumentSnapshot doc = await firestore
        .collection('users')
        .doc(user.uid)
        .get();
    if (!doc.exists) {
      // If the document doesn't exist, create a new one with data from Firebase Auth , this happen also when login with google for the first time because google doesn't provide shopName and shopLogoUrl
      final model = SettingsUserModel(
        id: user.uid,
        displayName: user.displayName ?? '',
        email: user.email ?? '',
        shopName: '',
        shopLogoUrl: user.photoURL ?? '',
        shopId: 'SHOP-${user.uid.substring(0, 5).toUpperCase()}',
      );
      // Save the new document to Firestore
      await firestore
          .collection(kUsersCollection)
          .doc(user.uid)
          .set(model.toFirestore());
      return model;
    }
    return SettingsUserModel.fromFireStore(
      doc.data() as Map<String, dynamic>,
      doc.id,
    );
  }

  @override
  Future<void> logout() async {
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
    }
    await firebaseAuth.signOut();
  }

  @override
  Future<void> updateDisplayName(String displayName) async {
    final User? user = firebaseAuth.currentUser;
    if (user == null) return;
    // Update the display name in Firebase Auth and Firestore at the same time
    await Future.wait([
      user.updateDisplayName(displayName),
      firestore.collection(kUsersCollection).doc(user.uid).update({
        kDisplayName: displayName,
      }),
    ]);
  }

  @override
  Future<void> updateShopLogoUrl(String url) async {
    final User? user = firebaseAuth.currentUser;
    if (user == null) return;
    // Update the shop logo url in Firebase Auth and Firestore at the same time
    await Future.wait([
      user.updatePhotoURL(url),
      firestore.collection(kUsersCollection).doc(user.uid).update({
        kShopLogoUrl: url,
      }),
    ]);
  }

  @override
  Future<void> updateShopName(String shopName) async {
    final String uid = firebaseAuth.currentUser!.uid;
    await firestore.collection(kUsersCollection).doc(uid).update({
      kShopName: shopName,
    });
  }

  @override
  Future<String> uploadShopLogo(File image) async {
    final String uid = firebaseAuth.currentUser!.uid;
    final String path = '$uid.jpg';

    // Try to delete the old image first to avoid orphaned files in storage, if it doesn't exist it's not a problem because we're going to upload the new one anyway, and Supabase will overwrite it if it already exists because we're using upsert: true
    try {
      await supabase.storage.from('avatars').remove([path]);
    } catch (_) {}

    // Upload the new image, using the user ID as the file name to ensure uniqueness and easy retrieval, and set content type to image/jpeg for proper handling, and use upsert to overwrite if the file already exists which is useful for updating the logo
    await supabase.storage
        .from('avatars')
        .upload(
          path,
          image,
          fileOptions: const FileOptions(
            contentType: 'image/jpeg',
            upsert: true,
          ),
        );

    // Add timestamp to the URL to force refresh the image in the UI after updating, because Supabase doesn't provide a way to invalidate the cache or get a new URL after uploading a new file with the same name, so we use a common trick of adding a query parameter with the current timestamp to ensure that the browser treats it as a new URL and fetches the updated image instead of using the cached one
    final String baseUrl = supabase.storage.from('avatars').getPublicUrl(path);
    return '$baseUrl?t=${DateTime.now().millisecondsSinceEpoch}';
  }
}
