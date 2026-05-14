import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
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
    this.fallbackLetter,
  });
  final File? selectedImage;
  final String existingImageUrl;
  final bool isUploading;
  final double size;
  final String? fallbackLetter;
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
    if (fallbackLetter != null && fallbackLetter!.isNotEmpty) {
      return Center(
        child: Text(
          fallbackLetter!,
          style: AppStyles.h2Bold22(
            context,
          ).copyWith(color: AppColorsDarkMode.primary, fontSize: size * 0.35),
        ),
      );
    }
    return ProductEmptyImage();
  }
}
