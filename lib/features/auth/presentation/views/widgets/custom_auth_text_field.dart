import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/theme/theme_data/app_theme_dark_mode.dart';

class CustomAuthTextField extends StatelessWidget {
  const CustomAuthTextField({
    super.key,
    required this.label,
    required this.hint,
  });
  final String label, hint;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.labelSemiBold13(
            context,
          ).copyWith(color: AppColorsDarkMode.textSecondary),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email_outlined),
            hintText: hint,
            suffix: Icon(Icons.remove_red_eye),
          ),
        ),
      ],
    );
  }
}
