import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class CustomTextField extends StatelessWidget {
  final String label, hint;
  final IconData prefixIcon;
  final Widget extraWidget;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? suffixText;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Color? labelColor;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    this.extraWidget = const SizedBox(),
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    required this.controller,
    this.validator,
    this.labelColor = AppColorsDarkMode.textSecondary,
    this.suffixText,
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
              ).copyWith(color: labelColor),
            ),
            Spacer(),
            extraWidget,
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
            suffixIcon:
                suffixIcon ??
                (suffixText != null
                    ? Center(
                        widthFactor: 1,
                        child: Text(
                          suffixText!,
                          style: Theme.of(
                            context,
                          ).inputDecorationTheme.suffixStyle,
                        ),
                      )
                    : null),
          ),
        ),
      ],
    );
  }
}
