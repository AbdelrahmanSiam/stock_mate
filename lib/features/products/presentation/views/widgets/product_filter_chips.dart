import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/custom_filter_chip.dart';
import 'package:stock_mate/features/products/presentation/manager/cubits/products_cubit/products_cubit.dart';
import 'package:stock_mate/generated/l10n.dart';

class ProductFilterChips extends StatelessWidget {
  final ProductFilter activeFilter;
  final ValueChanged<ProductFilter> onFilterChanged;

  const ProductFilterChips({
    super.key,
    required this.activeFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final filters = [
      (ProductFilter.all, S.of(context).all),
      (ProductFilter.lowStock, S.of(context).lowStock),
      (ProductFilter.outOfStock, S.of(context).outOfStock),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((entry) {
          final (filter, label) = entry;
          final bool isActive = activeFilter == filter;

          return GestureDetector(
            onTap: () => onFilterChanged(filter),
            child: CustomFilterChip(isActive: isActive, filterChipName: label),
          );
        }).toList(),
      ),
    );
  }
}
