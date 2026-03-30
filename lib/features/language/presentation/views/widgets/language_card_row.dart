import 'package:flutter/material.dart';
import 'package:stock_mate/features/language/domain/entity/language_card_entity.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/language_card_text.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/radio_button.dart';

class LanguageCardRow extends StatelessWidget {
  const LanguageCardRow({
    super.key,
    required this.languageName,
    required this.languageTagline,
    required this.isSelected,
  });

  final String languageName;
  final String languageTagline;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(isSelected ? Icons.play_arrow : Icons.pause),
        SizedBox(width: 16),
        Expanded(
          child: LanguageCardText(
            languageName: languageName,
            languageTagline: languageTagline,
          ),
        ),
        Spacer(),
        RadioButton(isSelected: isSelected),
      ],
    );
  }
}
