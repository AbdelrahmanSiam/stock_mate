import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/auth/domain/entities/user_entity.dart';
import 'package:stock_mate/features/auth/domain/repo/auth_repo.dart';
import 'package:stock_mate/features/auth/domain/use_cases/login_use_case/login_parameters.dart';

class LoginUseCase extends UseCase<UserEntity, LoginParameters> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});
  @override
  Future<Either<Failure, UserEntity>> call([LoginParameters? param]) {
    return authRepository.login(email: param!.email, password: param.password);
  }
}
