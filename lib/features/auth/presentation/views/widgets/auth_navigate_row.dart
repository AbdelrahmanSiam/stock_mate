import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class AuthNavigateRow extends StatelessWidget {
  const AuthNavigateRow({
    super.key,
    required this.text,
    required this.navName,
    required this.onTap,
  });
  final String text;
  final String navName;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: AppStyles.bodySmallRegular12(context)),
        GestureDetector(
          onTap: onTap,
          child: Text(
            navName,
            style: AppStyles.cardTitleSemiBold14(
              context,
            ).copyWith(color: AppColorsDarkMode.primary),
          ),
        ),
      ],
    );
  }
}
