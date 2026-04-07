import 'package:firebase_auth/firebase_auth.dart';
import 'package:stock_mate/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.email,
    required super.displayName,
    required super.shopName,
    required super.isEmailVerified,
  });

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      id: user.uid,
      email: user.email ?? "",
      displayName: user.displayName ?? "",
      shopName: "",
      isEmailVerified: user.emailVerified,
    );
  }
}
