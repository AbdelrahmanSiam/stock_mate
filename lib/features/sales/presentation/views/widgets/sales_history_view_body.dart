import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/dashboard/domain/entites/recent_sale_entity.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/recent_sale_card_widget.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sales_filter_tabs.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sales_summary_card.dart';
import 'package:stock_mate/generated/l10n.dart';

class SalesHistoryViewBody extends StatelessWidget {
  const SalesHistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SalesFilterTabs(
            activeFilter: S.of(context).thisWeek,
            onFilterChanged: (value) {},
          ),
          const SizedBox(height: 40),
          SalesSummaryCard(totalSales: 40, grossRevenue: 4200),
          const SizedBox(height: 40),
          Text(
            S.of(context).recentTransactions,
            style: AppStyles.labelSemiBold13(
              context,
            ).copyWith(color: AppColorsDarkMode.textSecondary),
          ),
          const SizedBox(height: 20),
          RecentSaleCardWidget(
            showCompletedBadge: true,
            sale: RecentSaleEntity(
              invoiceNumber: "invoiceNumber",
              paymentMethod: "paymentMethod",
              totalAmount: 200,
              createdAt: DateTime.now(),
            ),
          ),
        ],
      ),
    );
  }
}
