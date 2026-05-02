import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_detail_header_card.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_purchased_item_row.dart';
import 'package:stock_mate/generated/l10n.dart';

class SaleDetailViewBody extends StatelessWidget {
  const SaleDetailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SaleDetailHeaderCard(
            sale: SaleEntity(
              id: "1",
              invoiceNumber: "invoiceNumber",
              paymentMethod: "paymentMethod",
              totalAmount: 100,
              itemsCount: 2,
              items: [],
              createdAt: DateTime.now(),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            S.of(context).purchasedItems,
            style: AppStyles.labelSemiBold13(
              context,
            ).copyWith(color: AppColorsDarkMode.textSecondary),
          ),
          const SizedBox(height: 20),
          SalePurchasedItemRow(
            item: InvoiceItemEntity(
              productId: "INV-834789419",
              productName: "productName",
              productImageUrl:
                  "https://mo3datee.com/product/dekor-1012%D8%B1%D9%88%D9%84%D8%A9-%D8%A7%D9%84%D8%B3%D9%8A%D9%84%D8%B1-%D9%88-%D8%A7%D9%84%D8%BA%D9%8A%D8%B1%D8%A7%D8%A1-25-%D8%B3%D9%85-%D8%AF%D9%8A%D9%83%D9%88%D8%B1-%D8%AA%D8%B1%D9%83%D9%8A/?srsltid=AfmBOopLCyfT0mjQaw_ROnN0YitjzPuybqCOl-8faXzeLi3a2jaaVhZu",
              unitPrice: 10,
              quantity: 3,
              availableStock: 2,
            ),
          ),
        ],
      ),
    );
  }
}
