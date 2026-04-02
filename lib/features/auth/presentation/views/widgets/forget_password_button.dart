import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // enter new password from gmail
      },
      child: Text(
        S.of(context).forgetPassword,
        style: AppStyles.cardTitleSemiBold14(
          context,
        ).copyWith(color: AppColorsDarkMode.primary),
      ),
    );
  }
}
