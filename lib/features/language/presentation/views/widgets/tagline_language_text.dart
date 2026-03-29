import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';

class TaglineLanguageText extends StatelessWidget {
  const TaglineLanguageText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Choose your language",style: AppStyles.languageRegular18(context),),
        SizedBox(height: 10,),
        Text("اختر لغتك",style: AppStyles.languageRegular18(context),),
      ],
    );
  }
}