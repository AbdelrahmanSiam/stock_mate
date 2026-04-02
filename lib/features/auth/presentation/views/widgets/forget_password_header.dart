import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class ForgetPasswordHeader extends StatelessWidget {
  const ForgetPasswordHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).forgetPassword,
          style: AppStyles.appNameBold32(
            context,
          ).copyWith(color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          S.of(context).forgetPasswordTagline,
          style: AppStyles.bodyMediumRegular14(
            context,
          ).copyWith(color: AppColorsDarkMode.textSecondary),
        ),
      ],
    );
  }
}
