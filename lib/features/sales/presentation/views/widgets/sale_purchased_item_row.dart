import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_image.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';
import 'package:stock_mate/generated/l10n.dart';

class SalePurchasedItemRow extends StatelessWidget {
  final InvoiceItemEntity item;

  const SalePurchasedItemRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final sku = item.productId.length >= 8
        ? item.productId.substring(0, 8).toUpperCase()
        : item.productId.toUpperCase();
    return Row(
      children: [
        ProductImage(imageUrl: item.productImageUrl),
        const SizedBox(width: 12),
        Expanded(
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
                '${S.of(context).sku}: $sku',
                style: AppStyles.captionRegular10(context),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${item.unitPrice.toStringAsFixed(2)}',
              style: AppStyles.labelSemiBold13(context),
            ),
            const SizedBox(height: 4),
            Text(
              'x${item.quantity}',
              style: AppStyles.captionRegular10(
                context,
              ).copyWith(color: AppColorsDarkMode.textSecondary),
            ),
          ],
        ),
      ],
    );
  }
}
