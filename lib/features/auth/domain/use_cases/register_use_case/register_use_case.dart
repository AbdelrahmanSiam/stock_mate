import 'package:dartz/dartz.dart';

import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/auth/domain/entities/user_entity.dart';
import 'package:stock_mate/features/auth/domain/repo/auth_repo.dart';
import 'package:stock_mate/features/auth/domain/use_cases/register_use_case/register_parameters.dart';

class RegisterUseCase extends UseCase<UserEntity, RegisterParameters> {
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});
  @override
  Future<Either<Failure, UserEntity>> call([RegisterParameters? param]) {
    return authRepository.register(
      email: param!.email,
      password: param.password,
      displayName: param.displayName,
      shopName: param.shopName,
    );
  }
}
