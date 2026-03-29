import 'package:flutter/material.dart';
import 'package:stock_mate/features/language/domain/entity/language_card_entity.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/language_card_widget.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/language_cards_section.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/language_header_section.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/language_hint_widget.dart';

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
          LanguageCardsSection(),
          SizedBox(height: 16),
          LanguageHintWidget(),
        ],
      ),
    );
  }
}




