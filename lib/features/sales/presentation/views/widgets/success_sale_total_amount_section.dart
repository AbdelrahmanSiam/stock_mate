import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/generated/l10n.dart';

class SuccessSaleTotalAmountSection extends StatelessWidget {
  const SuccessSaleTotalAmountSection({super.key, required this.sale});

  final SaleEntity sale;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).totalAmount,
          style: AppStyles.captionRegular10(context).copyWith(
            color: AppColorsDarkMode.textSecondary,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              sale.totalAmount.toStringAsFixed(0),
              style: AppStyles.h1Bold28(context).copyWith(
                color: Color(0XFFFFDB9D),
                fontSize: getResponsiveFontSize(context, fontSize: 40),
              ),
            ),
            const SizedBox(width: 6),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                S.of(context).egp,
                style: AppStyles.h2Bold22(
                  context,
                ).copyWith(color: Color(0XFFFFDB9D).withValues(alpha: 0.75)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}