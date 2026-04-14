import 'package:flutter/material.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_filter_chip.dart';
import 'package:stock_mate/generated/l10n.dart';

class ProductFilterChips extends StatelessWidget {
  const ProductFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ProductFilterChip(
            isActive: true,
            filterChipName: S.of(context).all,
          ),
          ProductFilterChip(
            isActive: false,
            filterChipName: S.of(context).lowStock,
          ),
          ProductFilterChip(
            isActive: false,
            filterChipName: S.of(context).outOfStock,
          ),
        ],
      ),
    );
  }
}
