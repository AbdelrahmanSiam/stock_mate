import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/core/services/notification_service.dart';
import 'package:stock_mate/features/products/data/data_sources/remote/product_remote_datasource/product_remote_datasource.dart';
import 'package:stock_mate/features/products/data/models/product_model.dart';

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final FirebaseFirestore firestore;
  final NotificationService notificationService;
  final Set<String> _notifiedProductIds = {};

  ProductRemoteDatasourceImpl(this.firestore, this.notificationService);
  @override
  Future<void> addProduct(ProductModel product) async {
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    await firestore.collection(kProductsCollection).doc(product.id).set({
      kUserId: uid,
      ...product.toFirebase(),
    });
  }

  @override
  Future<void> deleteProduct(String id) async {
    await firestore.collection(kProductsCollection).doc(id).delete();
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    await firestore
        .collection(kProductsCollection)
        .doc(product.id)
        .update(product.toFirebase());
  }

  @override
  Stream<List<ProductModel>> getProducts() {
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    return firestore
        .collection(kProductsCollection)
        .where(kUserId, isEqualTo: uid)
        .orderBy(kCreatedAt, descending: true)
        .snapshots()
        .map((snapshot) {
          final products = snapshot.docs
              .map((doc) => ProductModel.fromFirebase(doc.data(), doc.id))
              .toList();
          // Check low stock in background
          _checkLowStock(products);
          return products;
        });
  }

  // Check for low stock and show notifications
  // Use Future.microtask to avoid blocking the stream
  void _checkLowStock(List<ProductModel> products) {
    Future.microtask(() async {
      for (final product in products) {
        // If the product is no longer low stock, remove it from the notified set
        // This ensures that if the stock is replenished and then goes low again, the user will receive a new notification
        if (!product.isLowStock) {
          _notifiedProductIds.remove(product.id);
          continue;
        }
        // If we've already notified about this product, skip it to avoid spamming notifications
        if (_notifiedProductIds.contains(product.id)) continue;
        _notifiedProductIds.add(product.id);
        await notificationService.showLowStockAlert(
          productName: product.name,
          currentStock: product.quantity,
          threshold: product.threshold,
        );
      }
    });
  }
}
