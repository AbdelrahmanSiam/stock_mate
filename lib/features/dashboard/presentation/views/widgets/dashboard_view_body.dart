import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/dashboard/domain/entites/dashboard_entity.dart';
import 'package:stock_mate/features/dashboard/domain/entites/recent_sale_entity.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_header_widget.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/recent_sales_section.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/stat_cards_grid.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/weekly_sales_chart.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

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
          StatCardsGrid(
            dashboard: DashboardEntity(
              totalProducts: 150,
              todaySales: 500,
              monthlyRevenue: 10000,
              lowStockCount: 10,
            ),
          ),
          const SizedBox(height: 30),
          WeeklySalesChart(salesData: [300, 450, 600, 550, 700, 800, 900]),
          const SizedBox(height: 30),
          RecentSalesSection(
            sales: [
              RecentSaleEntity(
                invoiceNumber: 'INV-001',
                paymentMethod: 'Credit Card',
                totalAmount: 150.00,
                createdAt: DateTime.now(),
              ),
              RecentSaleEntity(
                invoiceNumber: 'INV-002',
                paymentMethod: 'Cash',
                totalAmount: 200.00,
                createdAt: DateTime.now(),
              ),
              RecentSaleEntity(
                invoiceNumber: 'INV-003',
                paymentMethod: 'PayPal',
                totalAmount: 100.00,
                createdAt: DateTime.now(),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
