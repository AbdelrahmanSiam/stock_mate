import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class ForegroundAnimatedController extends StatelessWidget {
  const ForegroundAnimatedController({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.2,
      height: 4,
      color: AppColorsDarkMode.secondary,
    );
  }
}