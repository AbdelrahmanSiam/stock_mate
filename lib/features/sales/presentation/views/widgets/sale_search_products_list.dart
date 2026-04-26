import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_product_item.dart';

class SaleSearchProductsList extends StatelessWidget {
  const SaleSearchProductsList({
    super.key,
    required this.results,
    required this.onProductSelected,
  });

  final List<ProductEntity> results;
  final ValueChanged<ProductEntity> onProductSelected;

  @override
  Widget build(BuildContext context) {
    final visibleCount = results.length > 5 ? 5 : results.length;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 300),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: visibleCount,
        separatorBuilder: (_, __) =>
            Divider(height: 1, color: AppColorsDarkMode.border),
        itemBuilder: (_, index) {
          final product = results[index];

          return SaleProductItem(
            product: product,
            onProductSelected: onProductSelected,
          );
        },
      ),
    );
  }
}
