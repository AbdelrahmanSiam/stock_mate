import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/auth/domain/entities/user_entity.dart';
import 'package:stock_mate/features/auth/domain/repo/auth_repo.dart';

class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);
  @override
  Stream<Either<Failure, UserEntity?>> call([NoParameters? param]) {
    return repository.getCurrentUser();
  }
}
