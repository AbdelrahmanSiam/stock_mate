import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/dashboard/domain/entities/recent_sale_entity.dart';
import 'package:stock_mate/features/dashboard/presentation/views/helper/helper.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/receipt_icon.dart';
import 'package:stock_mate/generated/l10n.dart';

class RecentSaleCardWidget extends StatelessWidget {
  final RecentSaleEntity sale;

  const RecentSaleCardWidget({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColorsDarkMode.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColorsDarkMode.border, width: 1),
      ),
      child: Row(
        children: [
          ReceiptIcon(),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sale.invoiceNumber,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: AppStyles.labelSemiBold13(context),
                ),
                const SizedBox(height: 4),
                Text(
                  '${formatTime(context, sale.createdAt)} • ${sale.paymentMethod}',
                  style: AppStyles.bodySmallRegular12(context),
                ),
              ],
            ),
          ),
          Column(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: sale.totalAmount.toStringAsFixed(0),
                      style: AppStyles.h2Bold22(context),
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: S.of(context).egp,
                      style: AppStyles.labelSemiBold13(
                        context,
                      ).copyWith(color: AppColorsDarkMode.textPrimary),
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
}
