import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/total_row.dart';
import 'package:stock_mate/generated/l10n.dart';

class SaleDetailTotalsSection extends StatelessWidget {
  final double totalAmount;

  const SaleDetailTotalsSection({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColorsDarkMode.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColorsDarkMode.border),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          TotalRow(
            label: S.of(context).subtotal,
            value: '\$${totalAmount.toStringAsFixed(2)}',
            isTotal: false,
          ),
          const SizedBox(height: 8),
          Divider(color: AppColorsDarkMode.border),
          const SizedBox(height: 8),
          TotalRow(
            label: S.of(context).totalAmount,
            value: '\$${totalAmount.toStringAsFixed(2)}',
            isTotal: true,
          ),
        ],
      ),
    );
  }
}
