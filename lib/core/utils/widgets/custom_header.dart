import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key, required this.title, required this.actionText,
  });

final String title , actionText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.h2Bold22(context),
        ),
        Text(
          actionText,
          style: AppStyles.bodyMediumRegular14(
            context,
          ).copyWith(color: AppColorsDarkMode.primary),
        ),
      ],
    );
  }
}
