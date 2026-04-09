import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/features/dashboard/domain/entites/recent_sale_entity.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/receipt_icon.dart';

class RecentSaleCardWidget extends StatelessWidget {
  final RecentSaleEntity sale;

  const RecentSaleCardWidget({super.key, required this.sale});

  // بنحول الـ DateTime لنص
  String _formatTime(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inDays == 0) {
      // نفس اليوم → نعرض الوقت
      final hour = date.hour;
      final minute = date.minute.toString().padLeft(2, '0');
      final period = hour >= 12 ? 'PM' : 'AM';
      final hour12 = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
      return '$hour12:$minute $period';
    } else if (diff.inDays == 1) {
      return 'Yesterday';
    } else {
      return '${diff.inDays} days ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          ReceiptIcon(),
          const SizedBox(width: 12),

          // Invoice number + time + payment
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sale.invoiceNumber,
                  style: AppStyles.labelSemiBold13(context),
                ),
                const SizedBox(height: 4),
                Text(
                  '${_formatTime(sale.createdAt)} • ${sale.paymentMethod}',
                  style: AppStyles.bodySmallRegular12(context),
                ),
              ],
            ),
          ),

          // Total amount
          Text(
            '${sale.totalAmount.toStringAsFixed(0)} EGP',
            style: AppStyles.labelSemiBold13(
              context,
            ).copyWith(color: AppColorsDarkMode.textPrimary),
          ),
        ],
      ),
    );
  }
}
