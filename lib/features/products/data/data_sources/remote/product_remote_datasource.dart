import 'package:stock_mate/features/products/data/models/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<void> addProduct(ProductModel product);
}
