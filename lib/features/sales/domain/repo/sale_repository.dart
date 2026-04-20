import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';

abstract class SaleRepository {
  Future<Either<Failure, SaleEntity>> createSale({
    required List<InvoiceItemEntity> items,
    required String paymentMethod,
  });
}
