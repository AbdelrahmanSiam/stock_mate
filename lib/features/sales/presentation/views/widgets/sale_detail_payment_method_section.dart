import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class SaleDetailPaymentMethodSection extends StatelessWidget {
  final String paymentMethod;
  const SaleDetailPaymentMethodSection({
    super.key,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).paymentMethodLabel,
          style: AppStyles.captionRegular10(context).copyWith(
            letterSpacing: 1.5,
            color: AppColorsDarkMode.textSecondary,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Icon(
              _paymentIcon(paymentMethod),
              size: 16,
              color: AppColorsDarkMode.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(paymentMethod, style: AppStyles.labelSemiBold13(context)),
          ],
        ),
      ],
    );
  }

  IconData _paymentIcon(String method) {
    return switch (method.toLowerCase()) {
      'visa' || 'credit' => Icons.credit_card_outlined,
      'instapay' || 'instaPay' => Icons.phone_android_outlined,
      _ => Icons.payments_outlined, // Cash default
    };
  }
}
