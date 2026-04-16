import 'package:stock_mate/features/products/domain/data/models/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<void> addProduct(ProductModel product);
}
