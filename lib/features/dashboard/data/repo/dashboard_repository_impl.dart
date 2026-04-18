import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/features/dashboard/data/data_sources/dashboard_remote_datasource.dart';
import 'package:stock_mate/features/dashboard/domain/entites/dashboard_entity.dart';
import 'package:stock_mate/features/dashboard/domain/repo/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;
  DashboardRepositoryImpl({required this.remoteDataSource});
  @override
  Stream<Either<Failure, DashboardEntity>> getDashboardData() {
    return remoteDataSource
        .getDashboardData()
        .map((data) => Right<Failure, DashboardEntity>(data))
        .handleError(
          (error) => Left<Failure, DashboardEntity>(
            ServerFailure(errMessage: error.toString()),
          ),
        );
  }
}
