import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/dashboard/domain/entites/dashboard_entity.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_header_widget.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/stat_cards_grid.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomViewBody(
      widget: Column(
          children: [
            Spacer(),
            DashboardHeaderWidget(
              displayName: 'Abdul-Rahman',
              shopName: 'Al-Baraka',
            ),
            SizedBox(height: 24),
            StatCardsGrid(
              dashboard: DashboardEntity(
                totalProducts: 150,
                todaySales: 500,
                monthlyRevenue: 10000,
                lowStockCount: 10,
              ),
            ),
            Spacer(),
          ],
      ),
    );
  }
}
