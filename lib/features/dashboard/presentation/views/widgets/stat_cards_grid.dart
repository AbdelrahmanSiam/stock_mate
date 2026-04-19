import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/dashboard/domain/entites/dashboard_entity.dart';
import 'package:stock_mate/generated/l10n.dart';
import 'stat_card_widget.dart';

class StatCardsGrid extends StatelessWidget {
  final DashboardEntity dashboard;
  final void Function() onLowStockTapped;
  final void Function() onAllProductsTapped;

  const StatCardsGrid({
    super.key,
    required this.dashboard,
    required this.onLowStockTapped,
    required this.onAllProductsTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatCardWidget(
                icon: Icons.inventory_2_outlined,
                title: S.of(context).totalProducts,
                value: '${dashboard.totalProducts}',
                onTap: onAllProductsTapped,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCardWidget(
                icon: Icons.trending_up_rounded,
                title: S.of(context).todaySales,
                value: '${dashboard.todaySales}',
                valueColor: AppColorsDarkMode.success,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: StatCardWidget(
                icon: Icons.account_balance_wallet_outlined,
                title: S.of(context).monthlyRevenue,
                value:
                    '${dashboard.monthlyRevenue.toStringAsFixed(0)} ${S.of(context).egp}',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCardWidget(
                icon: Icons.warning_amber_rounded,
                title: S.of(context).lowStock,
                value: '${dashboard.lowStockCount}',
                valueColor: AppColorsDarkMode.error,
                showAlertBadge: dashboard.lowStockCount < 5,
                onTap: onLowStockTapped,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
