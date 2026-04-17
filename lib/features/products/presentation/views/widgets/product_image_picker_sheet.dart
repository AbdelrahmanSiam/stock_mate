import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_picker_tile.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_sheet_handle.dart';
import 'package:stock_mate/generated/l10n.dart';

class ProductImagePickerSheet extends StatelessWidget {
  final ValueChanged<File> onImageSelected;

  const ProductImagePickerSheet({super.key, required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ProductSheetHandle(),
          ProductPickerTile(
            icon: Icons.photo_library_outlined,
            title: S.of(context).gallery,
            onTap: () async {
              Navigator.pop(context);

              final XFile? file = await picker.pickImage(
                source: ImageSource.gallery,
                imageQuality: 80,
              );

              if (file != null) {
                onImageSelected(File(file.path));
              }
            },
          ),
          ProductPickerTile(
            icon: Icons.camera_alt_outlined,
            title: S.of(context).camera,
            onTap: () async {
              Navigator.pop(context);

              final XFile? file = await picker.pickImage(
                source: ImageSource.camera,
                imageQuality: 80,
              );

              if (file != null) {
                onImageSelected(File(file.path));
              }
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
