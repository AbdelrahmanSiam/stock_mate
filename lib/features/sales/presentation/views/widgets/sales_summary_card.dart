import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sales_history_gross_revenue_section.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sales_history_transaction_volume_section.dart';

class SalesSummaryCard extends StatelessWidget {
  final int totalSales;
  final double grossRevenue;
  const SalesSummaryCard({
    super.key,
  required this.totalSales,
    required this.grossRevenue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColorsDarkMode.primary.withValues(alpha: 0.5),
        ),
      ),
      child: AppCard(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        child: Row(
          children: [
            Expanded(
              child: SalesHistoryTransactionVolumeSection(
                totalSales: totalSales,
              ),
            ),
            const SizedBox(width: 5),
            Container(width: 1, height: 50, color: AppColorsDarkMode.border),
            const SizedBox(width: 20),
            Expanded(
              child: SalesHistoryGrossRevenueSection(
                grossRevenue: grossRevenue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
