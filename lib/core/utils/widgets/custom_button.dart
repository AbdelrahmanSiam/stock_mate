import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.buttonName,
    this.iconButton,
    this.changeColors = false,
  });

  final void Function()? onPressed;
  final bool isLoading;
  final String buttonName;
  final IconData? iconButton;
  final bool changeColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: changeColors
              ? AppColorsDarkMode.border
              : AppColorsDarkMode.primary,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: changeColors
              ? AppColorsDarkMode.textSecondary
              : AppColorsDarkMode.background,
          backgroundColor: changeColors
              ? AppColorsDarkMode.background
              : AppColorsDarkMode.primary,
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(iconButton, size: 20),
                  SizedBox(width: 10),
                  Text(buttonName, style: AppStyles.buttonSemiBold15(context)),
                ],
              ),
      ),
    );
  }
}
