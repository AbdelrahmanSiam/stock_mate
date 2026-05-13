import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/image_picker_content.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_image_picker_sheet.dart';
import 'package:stock_mate/features/settings/domain/enitites/settings_user_entity.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/edit_icon.dart';

class ShopLogo extends StatelessWidget {
  const ShopLogo({
    super.key,
    required this.user,
    required this.isUploadingLogo,
    this.selectedImage,
    required this.existingImageUrl,
    required this.onImageSelected,
  });
  final SettingsUserEntity user;
  final bool isUploadingLogo;
  final File? selectedImage;
  final String existingImageUrl;
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
            dashPattern: const [6, 3], // dash shape
            color: AppColorsDarkMode.primary.withValues(alpha: 0.5),
            strokeWidth: 1.5,
            radius: const Radius.circular(14),
            child: Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: AppColorsDarkMode.surface,
                borderRadius: BorderRadius.circular(14),
              ),
              child: ImagePickerContent(
                isUploading: isUploadingLogo,
                existingImageUrl: existingImageUrl,
                size: size,
              ),
            ),
          ),
          Positioned(bottom: -10, right: -10, child: EditIcon()),
        ],
      ),
    );
  }
}
