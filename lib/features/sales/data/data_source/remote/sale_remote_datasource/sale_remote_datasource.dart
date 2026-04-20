import 'package:stock_mate/features/sales/data/models/sale_model.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';

abstract class SaleRemoteDataSource {
  Future<SaleModel> createSale({
    required List<InvoiceItemEntity> items,
    required String paymentMethod,
  });
}
