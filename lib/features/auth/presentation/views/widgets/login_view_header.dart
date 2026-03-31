import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/splash/presentation/views/widgets/app_logo_widget.dart';
import 'package:stock_mate/generated/l10n.dart';

class LoginViewHeader extends StatelessWidget {
  const LoginViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        AppLogoWidget(iconHeight: 64, iconWidth: 64, iconColor: Colors.black),
        SizedBox(height: 12),
        Text(
          S.of(context).loginTagline,
          style: AppStyles.bodyMediumRegular14(
            context,
          ).copyWith(color: AppColorsDarkMode.textSecondary),
        ),
      ],
    );
  }
}
