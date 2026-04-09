import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/utils/widgets/custom_header.dart';
import 'package:stock_mate/features/dashboard/domain/entites/recent_sale_entity.dart';
import 'package:stock_mate/generated/l10n.dart';
import 'recent_sale_card_widget.dart';

class RecentSalesSection extends StatelessWidget {
  final List<RecentSaleEntity> sales;

  const RecentSalesSection({super.key, required this.sales});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to the full recent sales screen
          },
          child: CustomHeader(
            title: S.of(context).recentSales,
            actionText: S.of(context).viewAll,
          ),
        ),
        const SizedBox(height: 8),
        if (sales.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                S.of(context).noSalesYet,
                style: AppStyles.bodySmallRegular12(context),
              ),
            ),
          )
        else
          Column(
            children: sales.asMap().entries.map((entry) {
              int index = entry.key;
              RecentSaleEntity sale = entry.value;
              return Column(
                children: [
                  RecentSaleCardWidget(sale: sale),
                  if (index != sales.length - 1) const SizedBox(height: 10),
                ],
              );
            }).toList(),
          ),
      ],
    );
  }
}