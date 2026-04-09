import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_header_widget.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomViewBody(
      widget: Column(
        children: [
          SizedBox(height: 30),
          DashboardHeaderWidget(
            displayName: 'Abdul-Rahman',
            shopName: 'Al-Baraka',
          )
        ],
      ),
    );
  }
}
