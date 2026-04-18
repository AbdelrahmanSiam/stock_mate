import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
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
      (ProductFilter.all,        S.of(context).all),
      (ProductFilter.lowStock,   S.of(context).lowStock),
      (ProductFilter.outOfStock, S.of(context).outOfStock),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((entry) {
          final (filter, label) = entry;
          final bool isActive   = activeFilter == filter;

          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () => onFilterChanged(filter),
              child: AnimatedContainer(
                duration:  const Duration(milliseconds: 200),
                padding:   const EdgeInsets.symmetric(
                    horizontal: 18, vertical: 8),
                decoration: BoxDecoration(
                  color:        isActive
                      ? AppColorsDarkMode.primary
                      : AppColorsDarkMode.surface,
                  borderRadius: BorderRadius.circular(20),
                  border:       Border.all(
                    color: isActive
                        ? AppColorsDarkMode.primary
                        : AppColorsDarkMode.border,
                  ),
                ),
                child: Text(
                  label,
                  style: AppStyles.bodySmallRegular12(context).copyWith(
                    color: isActive
                        ? Colors.white
                        : AppColorsDarkMode.textSecondary,
                    fontWeight: isActive
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}