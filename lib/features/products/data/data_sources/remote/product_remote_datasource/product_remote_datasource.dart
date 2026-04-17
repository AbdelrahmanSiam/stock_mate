import 'package:stock_mate/features/products/data/models/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<void> addProduct(ProductModel product);
  Future<void> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
}
