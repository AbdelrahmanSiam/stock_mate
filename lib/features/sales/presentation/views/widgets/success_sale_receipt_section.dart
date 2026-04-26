import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_snack_bar.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/generated/l10n.dart';

class SuccessSaleReceiptSection extends StatelessWidget {
  const SuccessSaleReceiptSection({super.key, required this.sale});

  final SaleEntity sale;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          S.of(context).receiptId,
          style: AppStyles.captionRegular10(context).copyWith(
            letterSpacing: 1.5,
            color: AppColorsDarkMode.textSecondary,
          ),
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: sale.invoiceNumber));
            AppSnackBar.show(
              context,
              message: S.of(context).invoiceNumberCopied,
              type: SnackBarType.success,
            );
          },
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '#${sale.invoiceNumber}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                ),
              ),
              SizedBox(width: 6),
              Icon(Icons.copy_rounded),
            ],
          ),
        ),
      ],
    );
  }
}
