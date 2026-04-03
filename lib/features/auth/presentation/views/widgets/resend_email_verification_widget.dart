import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class ResendEmailVerificationWidget extends StatelessWidget {
  const ResendEmailVerificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).resendEmailTagline,
          style: AppStyles.bodyMediumRegular14(context),
        ),
        const SizedBox(height: 8,),
        GestureDetector(
          onTap: () {
            // resend email method
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).resendEmailButton,
                style: AppStyles.languageRegular16(
                  context,
                ).copyWith(color: AppColorsDarkMode.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
