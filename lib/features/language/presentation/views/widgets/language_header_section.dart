import 'package:flutter/material.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/tagline_language_text.dart';
import 'package:stock_mate/features/splash/presentation/views/widgets/app_logo_widget.dart';

class LanguageHeaderSection extends StatelessWidget {
  const LanguageHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppLogoWidget(),
        SizedBox(height: 12),
        TaglineLanguageText(),
      ],
    );
  }
}