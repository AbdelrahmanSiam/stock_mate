import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/auth/domain/repo/auth_repo.dart';

class CheckEmailVerifiedUseCase implements UseCase<bool, NoParameters> {
  final AuthRepository repository;
  const CheckEmailVerifiedUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call([NoParameters? param]) {
    return repository.checkEmailVerified();
  }
}