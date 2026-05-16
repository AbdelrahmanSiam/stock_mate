import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_emtpy_image.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_image_loading.dart';

class ProductNetworkImage extends StatelessWidget {
  const ProductNetworkImage({
    super.key,
    required this.existingImageUrl,
    required this.size,
  });

  final String existingImageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: CachedNetworkImage(
        imageUrl: existingImageUrl,
        fit: BoxFit.cover,
        width: size,
        height: size,
        placeholder: (_, __) => const ProductImageLoading(),
        errorWidget: (_, __, ___) => ProductEmptyImage(size: size,),
      ),
    );
  }
}
