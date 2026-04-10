import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/auth/domain/entities/user_entity.dart';
import 'package:stock_mate/features/auth/domain/repo/auth_repo.dart';

class GetCurrentUserUseCase implements UseCase<UserEntity?, NoParameters> {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);
  @override
  Future<Either<Failure, UserEntity?>> call([NoParameters? param]) async {
    return await repository.getCurrentUser();
  }
}