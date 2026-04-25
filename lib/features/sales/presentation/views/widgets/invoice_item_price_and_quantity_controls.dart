
import 'package:flutter/widgets.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/quantity_controls.dart';
import 'package:stock_mate/generated/l10n.dart';

class InvoiceItemPriceAndQuantityControls extends StatelessWidget {
  const InvoiceItemPriceAndQuantityControls({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
  });

  final InvoiceItemEntity item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '${item.totalPrice.toStringAsFixed(2)}\n${S.of(context).egp}',
          style: AppStyles.labelSemiBold13(
            context,
          ).copyWith(color: AppColorsDarkMode.primary),
          textAlign: TextAlign.end,
        ),
        const SizedBox(height: 8),
        QuantityControls(
          quantity: item.quantity,
          canIncrease: item.canIncrement,
          onIncrement: onIncrement,
          onDecrement: onDecrement,
        ),
      ],
    );
  }
}
