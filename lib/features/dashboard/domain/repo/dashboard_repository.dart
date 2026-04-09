import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/features/dashboard/domain/entites/dashboard_entity.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardEntity>> getDashboardData();
}