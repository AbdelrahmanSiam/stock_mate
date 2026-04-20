import 'package:stock_mate/features/sales/data/models/invoice_item_model.dart';
import 'package:stock_mate/features/sales/data/models/sale_model.dart';

abstract class SaleRemoteDataSource {
  Future<SaleModel> createSale({
    required List<InvoiceItemModel> items,
    required String paymentMethod,
  });
}
