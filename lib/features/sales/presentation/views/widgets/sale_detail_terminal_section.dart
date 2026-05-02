import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class SaleDetailTerminalSection extends StatelessWidget {
  const SaleDetailTerminalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).terminalLabel,
          style: AppStyles.captionRegular10(context).copyWith(
            letterSpacing: 1.5,
            color: AppColorsDarkMode.textSecondary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          S.of(context).mainRegister,
          style: AppStyles.labelSemiBold13(context),
        ),
      ],
    );
  }
}
