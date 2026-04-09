import 'package:flutter/material.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/bar_chart_widget.dart';
import 'package:stock_mate/core/utils/widgets/custom_header.dart';
import 'package:stock_mate/generated/l10n.dart';

class WeeklySalesChart extends StatelessWidget {
  final List<double> salesData;

  const WeeklySalesChart({super.key, required this.salesData});

  @override
  Widget build(BuildContext context) {
    final maxSalesValue = salesData.isEmpty
        ? 100.0
        : salesData.reduce((a, b) => a > b ? a : b) *
              1.2; // to return max value into salesData list and to add 20% for better visualization of the chart

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeader(title: S.of(context).weeklySalesChartTitle, actionText: S.of(context).allDays),
        const SizedBox(height: 8),
        BarChartWidget(maxSalesValue: maxSalesValue, salesData: salesData),
      ],
    );
  }
}
