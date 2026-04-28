import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/features/dashboard/domain/entities/recent_sale_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_filter.dart';

abstract class SaleRepository {
  Future<Either<Failure, SaleEntity>> createSale({
    required List<InvoiceItemEntity> items,
    required String paymentMethod,
  });
  Stream<Either<Failure, List<RecentSaleEntity>>> getRecentSales({
    required SaleFilter filter,
  });
}
