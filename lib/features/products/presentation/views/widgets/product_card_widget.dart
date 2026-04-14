import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_image.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/stock_badge.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Container(
          padding: EdgeInsets.all(width * 0.03),
          decoration: BoxDecoration(
            color: AppColorsDarkMode.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColorsDarkMode.border),
          ),
          child: Row(
            children: [
              ProductImage(imageUrl: productEntity.imageUrl),
              SizedBox(width: width * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productEntity.name,
                      style: AppStyles.priceBold16(
                        context,
                      ).copyWith(color: AppColorsDarkMode.textPrimary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: width * 0.01),
                    Text(
                      productEntity.category,
                      style: AppStyles.bodyMediumRegular14(context).copyWith(color: Colors.white60),
                    ),
                    SizedBox(height: width * 0.01),
                    Text(
                      productEntity.barcode,
                      style: AppStyles.captionRegular10(context),
                    ),
                  ],
                ),
              ),
              SizedBox(width: width * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${productEntity.sellPrice.toStringAsFixed(2)}',
                    style: AppStyles.statValueBold24(context).copyWith(color: AppColorsDarkMode.primary),
                  ),
                  SizedBox(height: width * 0.02),
                  StockBadge(product: productEntity),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
