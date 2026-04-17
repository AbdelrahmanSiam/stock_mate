import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/camera_icon.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/image_picker_content.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_image_picker_sheet.dart';

class ProductImagePickerWidget extends StatelessWidget {
  const ProductImagePickerWidget({
    super.key,
    this.selectedImage,
    required this.existingImageUrl,
    required this.isUploading,
    required this.onImageSelected,
  });
  final File? selectedImage;
  final String existingImageUrl;
  final bool isUploading;
  final ValueChanged<File> onImageSelected;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width * 0.35;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: AppColorsDarkMode.surface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          ),
          builder: (_) =>
              ProductImagePickerSheet(onImageSelected: onImageSelected),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(16),
            dashPattern: const [6, 3], // dash shape
            color: AppColorsDarkMode.primary.withValues(alpha: 0.5),
            strokeWidth: 1.5,
            child: Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: AppColorsDarkMode.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ImagePickerContent(
                isUploading: isUploading,
                existingImageUrl: existingImageUrl,
                size: size,
              ),
            ),
          ),
          Positioned(bottom: -10, right: -10, child: CameraIcon()),
        ],
      ),
    );
  }
}
