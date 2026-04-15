import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/products/domain/entities/helper/profit_calculator.dart';
import 'package:stock_mate/generated/l10n.dart';

class ProfitCardWidget extends StatelessWidget {
  final double buyPrice;
  final double sellPrice;

  const ProfitCardWidget({
    super.key,
    required this.buyPrice,
    required this.sellPrice,
  });

  @override
  Widget build(BuildContext context) {
    final double profit = ProfitCalculator.calculateProfit(buyPrice, sellPrice);
    final double percentage = ProfitCalculator.calculateProfitPercentage(
      buyPrice,
      sellPrice,
    );
    final bool isLoss = ProfitCalculator.isSellingAtLoss(buyPrice, sellPrice);

    final Color color = isLoss
        ? AppColorsDarkMode.error
        : AppColorsDarkMode.success;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        children: [
          Icon(
            isLoss ? Icons.trending_down : Icons.trending_up,
            color: color,
            size: 24,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).estimatedProfit,
                style: AppStyles.bodyMediumRegular14(
                  context,
                ).copyWith(color: color, letterSpacing: 1),
              ),
              const SizedBox(height: 4),
              Text(
                '${profit.abs().toStringAsFixed(0)} ${S.of(context).egp} '
                '(${percentage.abs().toStringAsFixed(0)}%)',
                style: AppStyles.h2Bold22(context).copyWith(color: color),
              ),
              if (isLoss)
                Text(
                  S.of(context).sellingAtLoss,
                  style: AppStyles.captionRegular10(
                    context,
                  ).copyWith(color: AppColorsDarkMode.error),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
