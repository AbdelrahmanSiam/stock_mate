import 'package:stock_mate/features/sales/data/data_source/remote/sale_remote_datasource/sale_remote_datasource.dart';
import 'package:stock_mate/features/sales/data/models/invoice_item_model.dart';
import 'package:stock_mate/features/sales/data/models/sale_model.dart';

class SaleRemoteDatasourceImpl implements SaleRemoteDataSource {
  @override
  Future<SaleModel> createSale({
    required List<InvoiceItemModel> items,
    required String paymentMethod,
  }) {
    // TODO: implement createSale
    throw UnimplementedError();
  }
}
