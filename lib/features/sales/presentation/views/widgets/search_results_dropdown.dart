import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_search_products_list.dart';

class SearchResultsDropdown extends StatelessWidget {
  final List<ProductEntity> results;
  final ValueChanged<ProductEntity> onProductSelected;

  const SearchResultsDropdown({
    super.key,
    required this.results,
    required this.onProductSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (results.isEmpty) return const SizedBox();

    return Container(
      margin: const EdgeInsets.only(top: 4),
      constraints: BoxConstraints(
        maxHeight: 300,
      ),
      decoration: BoxDecoration(
        color: AppColorsDarkMode.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColorsDarkMode.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SaleSearchProductsList(
        results: results,
        onProductSelected: onProductSelected,
      ),
    );
  }
}
