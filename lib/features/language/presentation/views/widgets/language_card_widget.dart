import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/language_card_row.dart';

class LanguageCardWidget extends StatelessWidget {
  const LanguageCardWidget({
    super.key,
    required this.isSelected,
    required this.languageName,
    required this.languageTagline,
    this.onTap,
  });
  final bool isSelected;
  final String languageName;
  final String languageTagline;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
        decoration: BoxDecoration(
          color: AppColorsDarkMode.surface,
          borderRadius: BorderRadius.circular(12),
          border: BoxBorder.all(
            color: isSelected
                ? AppColorsDarkMode.primary
                : AppColorsDarkMode.border,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: LanguageCardRow(
          languageName: languageName,
          languageTagline: languageTagline,
          isSelected: isSelected,
        ),
      ),
    );
  }
}
