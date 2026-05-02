// lib/features/sales/presentation/views/widgets/sale_detail_header_card.dart

import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/core/utils/widgets/completed_badge.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_time_and_date_section.dart';
import 'package:stock_mate/generated/l10n.dart';
import 'package:intl/intl.dart';

class SaleDetailHeaderCard extends StatelessWidget {
  final SaleEntity sale;

  const SaleDetailHeaderCard({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: SaleDateAndTimeSection(dateTime: sale.createdAt)),
              CompletedBadge(),
            ],
          ),

          const SizedBox(height: 16),
          Divider(color: AppColorsDarkMode.border),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: Column(
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
                          _paymentIcon(sale.paymentMethod),
                          size: 16,
                          color: AppColorsDarkMode.textSecondary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          sale.paymentMethod,
                          style: AppStyles.labelSemiBold13(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).terminalLabel,
                      style: AppStyles.captionRegular10(context).copyWith(
                        letterSpacing: 1.5,
                        color: AppColorsDarkMode.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      S.of(context).mainRegister,
                      style: AppStyles.labelSemiBold13(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
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
