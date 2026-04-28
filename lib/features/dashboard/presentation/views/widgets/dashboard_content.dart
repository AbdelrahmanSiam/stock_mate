import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stock_mate/features/dashboard/presentation/views/helper/helper.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_header_widget.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/recent_sales_section.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/stat_cards_grid.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/weekly_sales_chart.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({
    super.key,
    this.dashboard,
    required this.isLoading,
    required this.onLowStockTapped,
    required this.onAllProductsTapped,
    required this.onViewAllSalesTapped,
    required this.onViewMonthlyRevenueTapped,
  });

  final dynamic dashboard;
  final bool isLoading;
  final void Function() onLowStockTapped;
  final void Function() onAllProductsTapped;
  final void Function() onViewAllSalesTapped;
  final void Function() onViewMonthlyRevenueTapped;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      effect: const ShimmerEffect(
        highlightColor: Colors.grey,
        baseColor: Colors.black12,
      ),
      child: Column(
        children: [
          Spacer(),
          DashboardHeaderWidget(),
          const SizedBox(height: 30),
          StatCardsGrid(
            dashboard: isLoading ? fakeDashboard() : dashboard,
            onLowStockTapped: onLowStockTapped,
            onAllProductsTapped: onAllProductsTapped,
            onViewAllSalesTapped: onViewAllSalesTapped,
            onViewMonthlyRevenueTapped: onViewMonthlyRevenueTapped,
          ),
          const SizedBox(height: 30),
          WeeklySalesChart(
            salesData: isLoading
                ? fakeDashboard().weeklySalesAmounts
                : dashboard.weeklySalesAmounts,
          ),
          const SizedBox(height: 30),
          RecentSalesSection(
            onViewAllSalesTapped: onViewAllSalesTapped,
            sales: isLoading
                ? fakeDashboard().recentSales
                : dashboard.recentSales,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
