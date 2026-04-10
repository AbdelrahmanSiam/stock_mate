import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stock_mate/core/constants/constants.dart';

Future getTotalProducts(FirebaseFirestore firestore) async {
  final snapshot = await firestore
      .collection(kProductsCollection)
      .count()
      .get();
  return snapshot.count ?? 0;
}

Future<int> getLowStockCount(FirebaseFirestore firestore) async {
  final snapshot = await firestore.collection(kProductsCollection).get();

  int count = 0;
  for (final doc in snapshot.docs) {
    final data = doc.data();
    final quantity = (data[kQuantity] as num).toInt();
    final threshold = (data[kThreshold] as num).toInt();
    if (quantity <= threshold) {
      count++;
    }
  }
  return count;
}
