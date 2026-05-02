import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_purchased_item_row.dart';

class SalePurchasedItemList extends StatelessWidget {
  final List<InvoiceItemEntity> items;
  const SalePurchasedItemList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColorsDarkMode.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColorsDarkMode.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: items.asMap().entries.map((e) {
            final index = e.key;
            final item = e.value;
            return Column(
              children: [
                SalePurchasedItemRow(item: item),
                const SizedBox(height: 16),
                if (index != items.length - 1)
                  Divider(color: AppColorsDarkMode.border),
                if (index != items.length - 1) const SizedBox(height: 16),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
