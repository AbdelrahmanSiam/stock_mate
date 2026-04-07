import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/auth/domain/repo/auth_repo.dart';

class SendEmailVerificationUseCase implements UseCase<void, NoParameters> {
  final AuthRepository repository;
  const SendEmailVerificationUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call([NoParameters? param]) {
    return repository.sendEmailVerification();
  }
}