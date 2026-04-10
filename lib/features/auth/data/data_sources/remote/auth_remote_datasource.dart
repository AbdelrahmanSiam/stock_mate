import 'package:stock_mate/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> signInWithGoogle();
  Future<UserModel> register({
    required String email,
    required String password,
    required String displayName,
    required String shopName,
  });

  Future<void> sendEmailVerification();

  Future<bool> checkEmailVerified();

  Future<void> sendPasswordResetEmail({required String email});

  Future<void> logout();

  Future<UserModel?> getCurrentUser();
}
