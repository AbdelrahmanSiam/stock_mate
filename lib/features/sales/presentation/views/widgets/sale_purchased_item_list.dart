import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_purchased_item_row.dart';

class SalePurchasedItemList extends StatelessWidget {
  const SalePurchasedItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final list = [
      InvoiceItemEntity(
        productId: "INV-834789419",
        productName: "productName",
        productImageUrl:
            "https://mo3datee.com/product/dekor-1012%D8%B1%D9%88%D9%84%D8%A9-%D8%A7%D9%84%D8%B3%D9%8A%D9%84%D8%B1-%D9%88-%D8%A7%D9%84%D8%BA%D9%8A%D8%B1%D8%A7%D8%A1-25-%D8%B3%D9%85-%D8%AF%D9%8A%D9%83%D9%88%D8%B1-%D8%AA%D8%B1%D9%83%D9%8A/?srsltid=AfmBOopLCyfT0mjQaw_ROnN0YitjzPuybqCOl-8faXzeLi3a2jaaVhZu",
        unitPrice: 10,
        quantity: 3,
        availableStock: 2,
      ),
      InvoiceItemEntity(
        productId: "INV-834789419",
        productName: "productName",
        productImageUrl:
            "https://mo3datee.com/product/dekor-1012%D8%B1%D9%88%D9%84%D8%A9-%D8%A7%D9%84%D8%B3%D9%8A%D9%84%D8%B1-%D9%88-%D8%A7%D9%84%D8%BA%D9%8A%D8%B1%D8%A7%D8%A1-25-%D8%B3%D9%85-%D8%AF%D9%8A%D9%83%D9%88%D8%B1-%D8%AA%D8%B1%D9%83%D9%8A/?srsltid=AfmBOopLCyfT0mjQaw_ROnN0YitjzPuybqCOl-8faXzeLi3a2jaaVhZu",
        unitPrice: 10,
        quantity: 3,
        availableStock: 2,
      ),
    ];
    return Container(
      decoration: BoxDecoration(
        color: AppColorsDarkMode.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColorsDarkMode.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: list.asMap().entries.map((e) {
            final index = e.key;
            final item = e.value;
            return Column(
              children: [
                SalePurchasedItemRow(item: item),
                const SizedBox(height: 16),
                if (index != list.length - 1)
                  Divider(color: AppColorsDarkMode.border),
                if (index != list.length - 1) const SizedBox(height: 16),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
