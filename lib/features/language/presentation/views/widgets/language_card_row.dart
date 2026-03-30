import 'package:flutter/material.dart';
import 'package:stock_mate/features/language/domain/entity/language_card_entity.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/language_card_text.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/radio_button.dart';

class LanguageCardRow extends StatelessWidget {
  const LanguageCardRow({
    super.key,
    required this.languageCardEntity
  });

  final LanguageCardEntity languageCardEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.translate),
        SizedBox(width: 16),
        Expanded(
          child: LanguageCardText(
            languageName: languageCardEntity.languageName,
            languageTagline: languageCardEntity.languageTagline,
          ),
        ),
        Spacer(),
        RadioButton(code: languageCardEntity.code),
      ],
    );
  }
}


