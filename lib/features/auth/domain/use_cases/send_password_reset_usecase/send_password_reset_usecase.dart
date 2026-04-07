import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/auth/domain/repo/auth_repo.dart';
import 'package:stock_mate/features/auth/domain/use_cases/send_password_reset_usecase/send_password_reset_parameters.dart';

class SendPasswordResetUseCase
    implements UseCase<void, SendPasswordResetParams> {
  final AuthRepository repository;
  const SendPasswordResetUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call([SendPasswordResetParams? param]) {
    return repository.sendPasswordResetEmail(email: param!.email);
  }
}
