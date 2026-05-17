import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';

class LanguageCardText extends StatelessWidget {
  const LanguageCardText({
    super.key,
    required this.languageName,
    required this.languageTagline,
  });

  final String languageName;
  final String languageTagline;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(languageName, style: AppStyles.sectionTitleSemiBold16(context)),
        const SizedBox(height: 2),
        FittedBox(
          child: Text(
            languageTagline,
            style: AppStyles.bodySmallRegular12(context),
          ),
        ),
      ],
    );
  }
}
