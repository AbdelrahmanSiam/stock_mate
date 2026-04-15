import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class ImagePickerContent extends StatelessWidget {
  const ImagePickerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.camera_alt_outlined,
          color: AppColorsDarkMode.primary,
          size: 32,
        ),
        SizedBox(height: 8),
        Text(
          S.of(context).addPhoto,
          style: AppStyles.bodySmallRegular12(context),
        ),
      ],
    );
  }
}
