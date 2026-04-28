import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:stock_mate/features/dashboard/domain/repo/dashboard_repository.dart';

// will not implement UseCase because it is Future
class GetDashboardUseCase {
  final DashboardRepository repository;
  const GetDashboardUseCase(this.repository);

  Stream<Either<Failure, DashboardEntity>> call() {
    return repository.getDashboardData();
  }
}
