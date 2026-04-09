import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_header_widget.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/stat_card_widget.dart';

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
          StatCardWidget(
            icon: Icons.production_quantity_limits,
            title: 'Total Products',
            value: '150',
          ),
          Spacer(),
        ],
      ),
    );
  }
}
