import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: 22,
      width: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? AppColorsDarkMode.primary
              : AppColorsDarkMode.border,
          width: 2,
        ),
      ),
      child: isSelected
          ? const Icon(Icons.circle, color: Colors.white, size: 12)
          : null,
    );
  }
}
