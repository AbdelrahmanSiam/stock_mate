import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stock_mate/features/dashboard/data/data_sources/dashboard_remote_datasource.dart';
import 'package:stock_mate/features/dashboard/data/data_sources/helper/products_queries.dart';
import 'package:stock_mate/features/dashboard/data/data_sources/helper/sales_queries.dart';
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
      getTotalProducts(firestore),
      getTodaySalesCount(firestore, todayStart),
      getMonthlyRevenue(firestore, monthStart),
      getLowStockCount(firestore),
      getWeeklySales(firestore, weekStart),
      getRecentSales(firestore),
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
}
