import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/features/dashboard/domain/entities/dashboard_entity.dart';

abstract class DashboardRepository {
  Stream<Either<Failure, DashboardEntity>> getDashboardData();
}