import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/features/auth/data/data_sources/remote/auth_remote_datasource.dart';
import 'package:stock_mate/features/auth/data/repo/helper.dart';
import 'package:stock_mate/features/auth/domain/entities/user_entity.dart';
import 'package:stock_mate/features/auth/domain/repo/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, bool>> checkEmailVerified() async {
    return handleFirebaseAuthRequests(() => remoteDataSource.checkEmailVerified());
  }

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) {
    return handleFirebaseAuthRequests(
      () => remoteDataSource.login(email: email, password: password),
    );
  }

  @override
  Future<Either<Failure, void>> logout() {
    return handleFirebaseAuthRequests(() => remoteDataSource.logout());
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
    required String displayName,
    required String shopName,
  }) {
    return handleFirebaseAuthRequests(
      () => remoteDataSource.register(
        email: email,
        password: password,
        displayName: displayName,
        shopName: shopName,
      ),
    );
  }

  @override
  Future<Either<Failure, void>> sendEmailVerification() {
    return handleFirebaseAuthRequests(() => remoteDataSource.sendEmailVerification());
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail({
    required String email,
  }) {
    return handleFirebaseAuthRequests(
      () => remoteDataSource.sendPasswordResetEmail(email: email),
    );
  }
  
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() {
    return handleFirebaseAuthRequests(
      () => remoteDataSource.signInWithGoogle(),
    );
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() {
    return handleFirebaseAuthRequests(
      () => remoteDataSource.getCurrentUser(),
    );
  }
}
