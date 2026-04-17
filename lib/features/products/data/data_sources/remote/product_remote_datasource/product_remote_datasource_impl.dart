import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/features/products/data/data_sources/remote/product_remote_datasource/product_remote_datasource.dart';
import 'package:stock_mate/features/products/data/models/product_model.dart';

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final FirebaseFirestore firestore;
  const ProductRemoteDatasourceImpl(this.firestore);
  @override
  Future<void> addProduct(ProductModel product) async {
    await firestore
        .collection(kProductsCollection)
        .doc(product.id)
        .set(product.toFirebase());
  }
}
