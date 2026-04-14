import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_badge.dart';
import 'package:stock_mate/generated/l10n.dart';

class StockBadge extends StatelessWidget {
  const StockBadge({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    if (product.isOutOfStock) {
      return ProductBadge(
        label: S.of(context).out,
        bg: AppColorsDarkMode.error.withValues(alpha: 0.15),
        border: AppColorsDarkMode.error.withValues(alpha: 0.5),
        textColor: AppColorsDarkMode.error,
      );
    }
    if (product.isLowStock) {
      return ProductBadge(
        label: '${S.of(context).low}: ${product.quantity}',
        bg: AppColorsDarkMode.secondary.withValues(alpha: 0.15),
        border: AppColorsDarkMode.secondary.withValues(alpha: 0.5),
        textColor: AppColorsDarkMode.secondary,
      );
    }
    return ProductBadge(
      label: '${S.of(context).inStock}: ${product.quantity}',
      bg: AppColorsDarkMode.success.withValues(alpha: 0.15),
      border: AppColorsDarkMode.success.withValues(alpha: 0.5),
      textColor: AppColorsDarkMode.success,
    );
  }
}
