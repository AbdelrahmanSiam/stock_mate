import 'package:firebase_auth/firebase_auth.dart';
import 'package:stock_mate/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.email,
    required super.displayName,
    required super.shopName,
    required super.isEmailVerified,
    required super.shopLogoUrl,
  });

  factory UserModel.fromFirebase(User user, {String shopName = " "}) {
    return UserModel(
      id: user.uid,
      email: user.email ?? "",
      displayName: user.displayName ?? "",
      shopName: shopName,
      isEmailVerified: user.emailVerified,
      shopLogoUrl: "",
    );
  }
}
