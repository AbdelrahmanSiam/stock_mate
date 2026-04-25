import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_image.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/invoice_item_info.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/invoice_item_price_and_quantity_controls.dart';

class InvoiceItemRow extends StatelessWidget {
  final InvoiceItemEntity item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const InvoiceItemRow({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.productId),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onRemove(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColorsDarkMode.error.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.delete_outline,
          color: AppColorsDarkMode.error,
          size: 24,
        ),
      ),
      child: AppCard(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ProductImage(imageUrl: item.productImageUrl),
            const SizedBox(width: 12),
            InvoiceItemInfo(item: item),
            const SizedBox(width: 12),
            InvoiceItemPriceAndQuantityControls(
              item: item,
              onIncrement: onIncrement,
              onDecrement: onDecrement,
            ),
          ],
        ),
      ),
    );
  }
}
