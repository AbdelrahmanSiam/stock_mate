import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.displayName,
    required super.shopName,
    required super.shopLogoUrl,
    required super.isEmailVerified,
  });

  // ── fromFirebase ──────────────────────────────────────
  // from Firebase Auth User object
  factory UserModel.fromFirebase(
    User user, {
    String shopName = '',
    String shopLogoUrl = '',
  }) {
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      displayName: user.displayName ?? '',
      shopName: shopName,
      shopLogoUrl: shopLogoUrl,
      isEmailVerified: user.emailVerified,
    );
  }

  // ── fromFirestore ─────────────────────────────────────
  factory UserModel.fromFirestore(Map<String, dynamic> json) {
    return UserModel(
      id: json[kUserId] ?? '',
      email: json[kEmail] ?? '',
      displayName: json[kDisplayName] ?? '',
      shopName: json[kShopName] ?? '',
      shopLogoUrl: json[kShopLogoUrl] ?? '',
      isEmailVerified: json[kIsEmailVerified] ?? false,
    );
  }

  // ── toMap ─────────────────────────────────────────────
  // Use it when we need to write to Firestore
  Map<String, dynamic> toMap() {
    return {
      kUserId: id,
      kEmail: email,
      kDisplayName: displayName,
      kShopName: shopName,
      kShopLogoUrl: shopLogoUrl,
      kCreatedAt: FieldValue.serverTimestamp(),
    };
  }
}
