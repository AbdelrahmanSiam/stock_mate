
import 'dart:io';

import 'package:flutter/material.dart';

class ProductLocalImage extends StatelessWidget {
  const ProductLocalImage({
    super.key,
    required this.selectedImage,
    required this.size,
  });

  final File? selectedImage;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Image.file(
        selectedImage!,
        fit: BoxFit.cover,
        width: size,
        height: size,
      ),
    );
  }
}
