import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class EditIcon extends StatelessWidget {
  const EditIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: const BoxDecoration(
        color: AppColorsDarkMode.primary,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.edit, size: 14, color: Colors.white),
    );
  }
}
