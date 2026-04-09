// lib/features/dashboard/domain/entities/dashboard_entity.dart

import 'package:stock_mate/features/dashboard/domain/entites/recent_sale_entity.dart';

class DashboardEntity {
  final int totalProducts;
  final int todaySales;
  final double monthlyRevenue;
  final int lowStockCount;

  // // Last 7 days for the chart
  // // index 0 = oldest day | index 6 = today
  // final List<double> weeklySalesAmounts;

  // Last 3 sales
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