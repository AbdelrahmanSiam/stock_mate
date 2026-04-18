import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'product_card_widget.dart';

class ProductSkeletonWidget extends StatelessWidget {
  const ProductSkeletonWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: const ShimmerEffect(
        highlightColor: Colors.grey,
        baseColor: Colors.black12,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, __) => ProductCardWidget(
          productEntity: ProductEntity.empty(),
          isLoading: true,
        ),
      ),
    );
  }
}
