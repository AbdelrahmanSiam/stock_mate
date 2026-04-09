// lib/features/dashboard/domain/entities/dashboard_entity.dart

class DashboardEntity {
  final int totalProducts;
  final int todaySales;
  final double monthlyRevenue;
  final int lowStockCount;

  // // آخر 7 أيام للـ chart
  // // index 0 = أقدم يوم | index 6 = اليوم
  // final List<double> weeklySalesAmounts;

  // // آخر 3 مبيعات
  // final List<RecentSaleEntity> recentSales;

  const DashboardEntity({
    required this.totalProducts,
    required this.todaySales,
    required this.monthlyRevenue,
    required this.lowStockCount,
    // required this.weeklySalesAmounts,
    // required this.recentSales,
  });
}