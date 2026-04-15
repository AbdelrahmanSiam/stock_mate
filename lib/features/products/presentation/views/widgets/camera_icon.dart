import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class CameraIcon extends StatelessWidget {
  const CameraIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColorsDarkMode.primary,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: const Icon(Icons.add, size: 20, color: Colors.black),
      ),
    );
  }
}
