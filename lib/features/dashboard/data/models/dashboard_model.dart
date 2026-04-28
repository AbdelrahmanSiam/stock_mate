import 'package:stock_mate/features/dashboard/domain/entities/dashboard_entity.dart';

class DashboardModel extends DashboardEntity {
  DashboardModel({
    required super.totalProducts,
    required super.todaySales,
    required super.monthlyRevenue,
    required super.lowStockCount,
    required super.weeklySalesAmounts,
    required super.recentSales,
  });
  
}
