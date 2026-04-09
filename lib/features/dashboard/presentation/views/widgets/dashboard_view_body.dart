import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/dashboard/domain/entites/dashboard_entity.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_header_widget.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/recent_sales_section.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/stat_cards_grid.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/weekly_sales_chart.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key, this.dashboardEntity});
  final DashboardEntity? dashboardEntity;
  @override
  Widget build(BuildContext context) {
    return CustomViewBody(
      widget: Column(
        children: [
          Spacer(),
          DashboardHeaderWidget(
            displayName: 'Abdul-Rahman',
            shopName: 'Al-Baraka',
          ),
          const SizedBox(height: 30),
          StatCardsGrid(dashboard: dashboardEntity!),
          const SizedBox(height: 30),
          WeeklySalesChart(salesData: dashboardEntity!.weeklySalesAmounts),
          const SizedBox(height: 30),
          RecentSalesSection(sales: dashboardEntity!.recentSales),
          Spacer(),
        ],
      ),
    );
  }
}
