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
    return handleRequest(() => remoteDataSource.checkEmailVerified());
  }

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) {
    return handleRequest(
      () => remoteDataSource.login(email: email, password: password),
    );
  }

  @override
  Future<Either<Failure, void>> logout() {
    return handleRequest(() => remoteDataSource.logout());
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
    required String displayName,
  }) {
    return handleRequest(
      () => remoteDataSource.register(
        email: email,
        password: password,
        displayName: displayName,
      ),
    );
  }

  @override
  Future<Either<Failure, void>> sendEmailVerification() {
    return handleRequest(() => remoteDataSource.sendEmailVerification());
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail({
    required String email,
  }) {
    return handleRequest(
      () => remoteDataSource.sendPasswordResetEmail(email: email),
    );
  }
}
