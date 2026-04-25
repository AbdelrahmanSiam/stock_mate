import 'package:flutter/widgets.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';
import 'package:stock_mate/generated/l10n.dart';

class InvoiceItemInfo extends StatelessWidget {
  const InvoiceItemInfo({super.key, required this.item});

  final InvoiceItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.productName,
            style: AppStyles.labelSemiBold13(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            '${item.unitPrice.toStringAsFixed(2)} ${S.of(context).perUnit}',
            style: AppStyles.bodySmallRegular12(context),
          ),
          //  Stock warning
          if (!item.canIncrement)
            Text(
              S.of(context).insufficientStock(item.availableStock),
              style: AppStyles.captionRegular10(
                context,
              ).copyWith(color: AppColorsDarkMode.error),
            ),
        ],
      ),
    );
  }
}
