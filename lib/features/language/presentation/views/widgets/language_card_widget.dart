import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/language/domain/entity/language_card_entity.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/language_card_row.dart';

class LanguageCardWidget extends StatelessWidget {
  const LanguageCardWidget({
    super.key, required this.languageCardEntity,
  });
  final LanguageCardEntity languageCardEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: languageCardEntity.onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
        decoration: BoxDecoration(
          color: AppColorsDarkMode.surface,
          borderRadius: BorderRadius.circular(12),
          border: BoxBorder.all(
            color: languageCardEntity.isSelected
                ? AppColorsDarkMode.primary
                : AppColorsDarkMode.border,
            width: languageCardEntity.isSelected ? 1.5 : 1,
          ),
        ),
        child: LanguageCardRow(
          languageCardEntity: languageCardEntity,
        ),
      ),
    );
  }
}
