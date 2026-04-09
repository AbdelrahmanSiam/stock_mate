import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class WeeklySalesChart extends StatelessWidget {
  final List<double> salesData; // 7 قيم

  const WeeklySalesChart({super.key, required this.salesData});



  @override
  Widget build(BuildContext context) {
    final maxY = salesData.isEmpty
        ? 100.0
        : salesData.reduce((a, b) => a > b ? a : b) * 1.2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sales This Week',
              style: AppStyles.sectionTitleSemiBold16(context),
            ),
            Text(
              'Sat – Fri',
              style: AppStyles.bodySmallRegular12(context).copyWith(
                color: AppColorsDarkMode.primary,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 180,
          child: BarChart(
            BarChartData(
              maxY: maxY,
              minY: 0,
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: maxY / 4,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: AppColorsDarkMode.border,
                  strokeWidth: 0.5,
                ),
              ),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                // فوق وعلى اليمين: مخفيين
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                // تحت: أيام الأسبوع
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
                // شمال: مخفي
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
                      // اليوم الأخير (اليوم الحالي) بيبقى primary
                      // الباقي border color
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
      ],
    );
  }
}