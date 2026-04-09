import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/dashboard/presentation/views/helper/helper.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({
    super.key,
    required this.maxSalesValue,
    required this.salesData,
  });

  final double maxSalesValue;
  final List<double> salesData;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: AppColorsDarkMode.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColorsDarkMode.border, width: 1),
        ),
        child: BarChart(
          BarChartData(
            maxY: maxSalesValue,
            minY: 0,
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              drawHorizontalLine: false,
              horizontalInterval: maxSalesValue / 4,
              getDrawingHorizontalLine: (value) =>
                  FlLine(color: AppColorsDarkMode.border, strokeWidth: 0.5),
            ),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              // only down is shown and the rest is hidden
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    final index = value.toInt();
                    if (index < 0 || index >= dayLabels.length) {
                      return const SizedBox();
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        dayLabels[index],
                        style: AppStyles.captionRegular10(context),
                      ),
                    );
                  },
                ),
              ),
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            barGroups: List.generate(
              salesData.length,
              (index) => BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: salesData[index],
                    // today is primary color and the rest of the days is border color
                    color: index == salesData.length - 1
                        ? AppColorsDarkMode.primary
                        : AppColorsDarkMode.border,
                    width: 22,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
