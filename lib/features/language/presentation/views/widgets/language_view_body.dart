import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/features/language/domain/entity/language_card_entity.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/language_card_widget.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/language_header_section.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/language_hint_widget.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/tagline_language_text.dart';
import 'package:stock_mate/features/splash/presentation/views/widgets/app_logo_widget.dart';

class LanguageViewBody extends StatelessWidget {
  const LanguageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 80),
          LanguageHeaderSection(),
          SizedBox(height: 40),
          LanguageCardWidget(
            languageCardEntity: LanguageCardEntity(
              languageName: "English",
              languageTagline: "Continue in English",
              isSelected: true,
            ),
          ),
          SizedBox(height: 12),
          LanguageCardWidget(
            languageCardEntity: LanguageCardEntity(
              languageName: "العربية",
              languageTagline: "تابع بالعربية",
              isSelected: false,
            ),
          ),
          SizedBox(height: 16),
          LanguageHintWidget(),
        ],
      ),
    );
  }
}


