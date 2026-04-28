import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/features/dashboard/domain/entities/recent_sale_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_filter.dart';
import 'package:stock_mate/features/sales/domain/repo/sale_repository.dart';

class GetRecentSalesUseCase {
  final SaleRepository repository;

  GetRecentSalesUseCase({required this.repository});

  Stream<Either<Failure, List<RecentSaleEntity>>> call({
    required SaleFilter filter,
  }) {
    return repository.getRecentSales(filter: filter);
  }
}
