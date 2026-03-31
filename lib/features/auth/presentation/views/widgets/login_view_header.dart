import 'package:flutter/material.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/tagline_language_text.dart';
import 'package:stock_mate/features/splash/presentation/views/widgets/app_logo_widget.dart';

class LoginViewHeader extends StatelessWidget {
  const LoginViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppLogoWidget(iconHeight: 100, iconWidth: 100),
        SizedBox(height: 12),
        TaglineLanguageText(
          englishText: "Sign in to manage your inventory",
          arabicText: "سجّل دخولك لإدارة مخزونك",
        ),
      ],
    );
  }
}