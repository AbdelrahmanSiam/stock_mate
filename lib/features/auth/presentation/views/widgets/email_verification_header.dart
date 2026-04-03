
import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/generated/l10n.dart';

class EmailVerificationHeader extends StatelessWidget {
  const EmailVerificationHeader({
    super.key,
    required this.enteredEmail,
  });

  final String enteredEmail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).verifyYourEmail,
          style: AppStyles.appNameBold32(
            context,
          ).copyWith(color: Colors.white),
        ),
        Text(
          S.of(context).emailVerificationHeader1,
          style: AppStyles.languageRegular16(context),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: enteredEmail,
                style: AppStyles.sectionTitleSemiBold16(context),
              ),
              TextSpan(
                text: S.of(context).emailVerificationHeader2,
                style: AppStyles.languageRegular16(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
