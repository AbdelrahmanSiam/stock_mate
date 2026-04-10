import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/features/dashboard/data/data_sources/dashboard_remote_datasource.dart';
import 'package:stock_mate/features/dashboard/data/models/dashboard_model.dart';
import 'package:stock_mate/features/dashboard/domain/entites/recent_sale_entity.dart';

class DashboardRemoteDatasourceImpl implements DashboardRemoteDataSource {
  final FirebaseFirestore firestore;

  DashboardRemoteDatasourceImpl({required this.firestore});
  @override
  Future<DashboardModel> getDashboardData() async {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final monthStart = DateTime(now.year, now.month, 1);
    final weekStart = now.subtract(const Duration(days: 6));

    final result = await Future.wait([
      getTotalProducts(),
      getTodaySalesCount(todayStart),
      getMonthlyRevenue(monthStart),
      getLowStockCount(),
      getWeeklySales(weekStart),
      getRecentSales(),
    ]);
    return DashboardModel(
      totalProducts: result[0] as int,
      todaySales: result[1] as int,
      monthlyRevenue: result[2] as double,
      lowStockCount: result[3] as int,
      weeklySalesAmounts: result[4] as List<double>,
      recentSales: result[5] as List<RecentSaleEntity>,
    );
  }

  Future getTotalProducts() async {
    final snapshot = await firestore
        .collection(kProductsCollection)
        .count()
        .get();
    return snapshot.count ?? 0;
  }

  Future getTodaySalesCount(DateTime todayStart) async {
    final snapshot = await firestore
        .collection(kSalesCollection)
        .where(
          kCreatedAt,
          isGreaterThanOrEqualTo: Timestamp.fromDate(todayStart),
        )
        .count()
        .get();
    return snapshot.count ?? 0;
  }

  Future<double> getMonthlyRevenue(DateTime monthStart) async {
    final snapshot = await firestore
        .collection(kSalesCollection)
        .where(
          kCreatedAt,
          isGreaterThanOrEqualTo: Timestamp.fromDate(monthStart),
        )
        .get();
    double total = 0;
    for (final doc in snapshot.docs) {
      final data = doc.data();
      total += (data[kTotalAmount] as num).toDouble();
    }
    return total;
  }

  Future<int> getLowStockCount() async {
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

  Future<List<double>> getWeeklySales(DateTime weekStart) async {
    final snapshot = await firestore
        .collection(kSalesCollection)
        .where(
          kCreatedAt,
          isGreaterThanOrEqualTo: Timestamp.fromDate(weekStart),
        )
        .get();
    final Map<int , double> salesByDay = {};
    for (final doc in snapshot.docs) {
      final data = doc.data();
      final DateTime date = (data[kCreatedAt] as Timestamp).toDate();
      final int dayIndex = date.difference(weekStart).inDays;
      salesByDay[dayIndex] = (salesByDay[dayIndex] ?? 0) + (data[kTotalAmount] as num).toDouble();
    }
    return List.generate(7, (index) => salesByDay[index] ?? 0);
  }
}
