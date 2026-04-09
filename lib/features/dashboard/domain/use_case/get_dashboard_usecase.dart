import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/dashboard/domain/entites/dashboard_entity.dart';
import 'package:stock_mate/features/dashboard/domain/repo/dashboard_repository.dart';

class GetDashboardUseCase implements UseCase<DashboardEntity, NoParameters> {
  final DashboardRepository repository;
  const GetDashboardUseCase(this.repository);

  @override
  Future<Either<Failure, DashboardEntity>> call([NoParameters? param]) {
    return repository.getDashboardData();
  }
}