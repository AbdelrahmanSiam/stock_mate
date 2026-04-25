
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_image.dart';
import 'package:stock_mate/generated/l10n.dart';

class SaleProductItem extends StatelessWidget {
  const SaleProductItem({
    super.key,
    required this.product,
    required this.onProductSelected,
  });

  final ProductEntity product;
  final ValueChanged<ProductEntity> onProductSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      leading: ProductImage(
        imageUrl: product.imageUrl,
      ),
      title: Text(
        product.name,
        style: AppStyles.labelSemiBold13(context),
      ),
      subtitle: Text(
        '${product.sellPrice.toStringAsFixed(2)} ${S.of(context).egp}',
        style: AppStyles.bodySmallRegular12(context),
      ),
      trailing: product.isOutOfStock
          ? Text(
              S.of(context).out,
              style: AppStyles.captionRegular10(
                context,
              ).copyWith(color: AppColorsDarkMode.error),
            )
          : Icon(
              Icons.add_circle_outline,
              color: AppColorsDarkMode.primary,
              size: 22,
            ),
      onTap: product.isOutOfStock
          ? null
          : () => onProductSelected(product),
    );
  }
}
