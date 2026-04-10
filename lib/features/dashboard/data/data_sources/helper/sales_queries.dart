import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/features/dashboard/data/models/recent_sale_model.dart';
import 'package:stock_mate/features/dashboard/domain/entites/recent_sale_entity.dart';

Future<int> getTodaySalesCount(
  FirebaseFirestore firestore,
  DateTime todayStart,
) async {
  final snapshot = await firestore
      .collection(kSalesCollection)
      .where(kCreatedAt, isGreaterThanOrEqualTo: Timestamp.fromDate(todayStart))
      .count()
      .get();
  return snapshot.count ?? 0;
}

Future<double> getMonthlyRevenue(
  FirebaseFirestore firestore,
  DateTime monthStart,
) async {
  final snapshot = await firestore
      .collection(kSalesCollection)
      .where(kCreatedAt, isGreaterThanOrEqualTo: Timestamp.fromDate(monthStart))
      .get();
  double total = 0;
  for (final doc in snapshot.docs) {
    final data = doc.data();
    total += (data[kTotalAmount] as num).toDouble();
  }
  return total;
}

Future<List<double>> getWeeklySales(
  FirebaseFirestore firestore,
  DateTime weekStart,
) async {
  final snapshot = await firestore
      .collection(kSalesCollection)
      .where(kCreatedAt, isGreaterThanOrEqualTo: Timestamp.fromDate(weekStart))
      .get();
  final Map<int, double> salesByDay = {};
  for (final doc in snapshot.docs) {
    final data = doc.data();
    final DateTime date = (data[kCreatedAt] as Timestamp).toDate();
    final int dayIndex = date.difference(weekStart).inDays;
    salesByDay[dayIndex] =
        (salesByDay[dayIndex] ?? 0) + (data[kTotalAmount] as num).toDouble();
  }
  return List.generate(7, (index) => salesByDay[index] ?? 1);
}

Future<List<RecentSaleEntity>> getRecentSales(
  FirebaseFirestore firestore,
) async {
  final snapshot = await firestore
      .collection(kSalesCollection)
      .orderBy(kCreatedAt, descending: true)
      .limit(3)
      .get();
  return snapshot.docs
      .map((doc) => RecentSaleModel.fromFirestore(doc.data()))
      .toList();
}
