import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class CustomAuthTextField extends StatelessWidget {
  final String label, hint;
  final IconData prefixIcon;
  final Widget widget;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomAuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    this.widget = const SizedBox(),
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    required this.controller,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: AppStyles.labelSemiBold13(
                context,
              ).copyWith(color: AppColorsDarkMode.textSecondary),
            ),
            Spacer(),
            widget,
          ],
        ),
        SizedBox(height: 8),
        TextFormField(
          validator: validator,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            hintText: hint,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
