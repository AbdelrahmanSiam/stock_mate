import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    required this.iconHeight,
    required this.iconWidth,
    required this.iconColor,
  });
  final double iconHeight, iconWidth;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: iconHeight,
      width: iconWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFF6B2C), Color(0xFFFFB800)],
        ),
      ),
      child: Icon(Icons.inventory_2, color: iconColor),
    );
  }
}
