import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/generated/l10n.dart';

class SuccessSaleItemsSection extends StatelessWidget {
  const SuccessSaleItemsSection({super.key, required this.sale});

  final SaleEntity sale;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).itemsLabel,
          style: AppStyles.captionRegular10(context).copyWith(
            letterSpacing: 1.5,
            color: AppColorsDarkMode.textSecondary,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            const Icon(
              Icons.receipt_outlined,
              size: 16,
              color: AppColorsDarkMode.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              '${sale.itemsCount} ${S.of(context).units}',
              style: AppStyles.sectionTitleSemiBold16(context),
            ),
          ],
        ),
      ],
    );
  }
}
