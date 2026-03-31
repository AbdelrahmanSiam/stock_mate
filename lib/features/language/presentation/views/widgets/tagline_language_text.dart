import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';

class TaglineLanguageText extends StatelessWidget {
  const TaglineLanguageText({
    super.key, required this.englishText, required this.arabicText,
  });
  final String englishText , arabicText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(englishText,style: AppStyles.languageRegular16(context),),
        SizedBox(height: 4,),
        Text(arabicText,style: AppStyles.languageRegular16(context),),
      ],
    );
  }
}