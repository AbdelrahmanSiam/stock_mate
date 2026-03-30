import 'package:flutter/material.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/continue_button_section.dart';
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
          const Spacer(),
          LanguageHeaderSection(),
          const SizedBox(height: 40),
          LanguageCardsSection(),
          const SizedBox(height: 16),
          LanguageHintWidget(),
          const Spacer(),
          ContinueButtonSection(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}


