import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_emtpy_image.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_image_loading.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_local_image.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_network_image.dart';

class ImagePickerContent extends StatelessWidget {
  const ImagePickerContent({
    super.key,
    required this.isUploading,
    this.selectedImage,
    required this.existingImageUrl,
    required this.size,
  });
  final File? selectedImage;
  final String existingImageUrl;
  final bool isUploading;
  final double size;
  @override
  Widget build(BuildContext context) {
    if (isUploading) {
      return ProductImageLoading();
    }
    if (selectedImage != null) {
      return ProductLocalImage(selectedImage: selectedImage, size: size);
    }
    if (existingImageUrl.isNotEmpty) {
      return ProductNetworkImage(
        existingImageUrl: existingImageUrl,
        size: size,
      );
    }
    return ProductEmptyImage();
  }
}
