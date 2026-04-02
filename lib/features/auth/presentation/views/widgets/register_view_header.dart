import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class RegisterViewHeader extends StatelessWidget {
  const RegisterViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).createAccount,
          style: AppStyles.appNameBold32(context),
        ),
        const SizedBox(height: 8),
        Text(
          S.of(context).registerTagline,
          style: AppStyles.bodyMediumRegular14(
            context,
          ).copyWith(color: AppColorsDarkMode.textSecondary),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
