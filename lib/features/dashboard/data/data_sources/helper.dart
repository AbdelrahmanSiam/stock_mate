import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/features/dashboard/data/models/dashboard_model.dart';
import 'package:stock_mate/features/dashboard/data/models/recent_sale_model.dart';

DashboardModel buildDashboard({
  required QuerySnapshot<Map<String, dynamic>> productsSnapshot,
  required QuerySnapshot<Map<String, dynamic>> salesSnapshot,
  required DateTime todayStart,
  required DateTime monthStart,
  required DateTime weekStart,
}) {
  // Products Section
  final totalProducts = productsSnapshot.docs.length;

  int lowStockCount = 0;

  for (final doc in productsSnapshot.docs) {
    final data = doc.data();

    final quantity = (data[kQuantity] as num).toInt();
    final threshold = (data[kThreshold] as num).toInt();

    if (quantity <= threshold) {
      lowStockCount++;
    }
  }

  // Sales Section

  int todaySales = 0;
  double monthlyRevenue = 0;

  final Map<int, double> weeklyMap = {};

  final List<RecentSaleModel> recentSales = [];

  for (final doc in salesSnapshot.docs) {
    final data = doc.data();

    final createdAt = (data[kCreatedAt] as Timestamp).toDate();
    final amount = (data[kTotalAmount] as num).toDouble();

    // Today sales count
    if (!createdAt.isBefore(todayStart)) {
      todaySales++;
    }

    // Monthly revenue
    if (!createdAt.isBefore(monthStart)) {
      monthlyRevenue += amount;
    }

    // Weekly chart
    final dayIndex = createdAt.difference(weekStart).inDays;

    if (dayIndex >= 0 && dayIndex < 7) {
      weeklyMap[dayIndex] = (weeklyMap[dayIndex] ?? 0) + amount;
    }

    // Recent sales (top 3 only)
    if (recentSales.length < 3) {
      recentSales.add(RecentSaleModel.fromFirestore(data));
    }
  }

  final weeklySalesAmounts = List.generate(7, (index) => weeklyMap[index] ?? 0);

  return DashboardModel(
    totalProducts: totalProducts,
    todaySales: todaySales,
    monthlyRevenue: monthlyRevenue,
    lowStockCount: lowStockCount,
    weeklySalesAmounts: weeklySalesAmounts,
    recentSales: recentSales,
  );
}
