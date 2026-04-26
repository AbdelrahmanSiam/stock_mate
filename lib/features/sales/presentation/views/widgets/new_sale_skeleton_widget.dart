// lib/features/sales/presentation/views/widgets/new_sale_skeleton_widget.dart

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';
import 'invoice_item_row.dart';

class NewSaleSkeletonWidget extends StatelessWidget {
  const NewSaleSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: const ShimmerEffect(
        highlightColor: Colors.grey,
        baseColor: Colors.black12,
      ),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: 3,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, __) => InvoiceItemRow(
          item: InvoiceItemEntity.empty(),
          onIncrement: () {},
          onDecrement: () {},
          onRemove: () {},
        ),
      ),
    );
  }
}
