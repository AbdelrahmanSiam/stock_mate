import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/features/language/domain/entity/language_card_entity.dart';
import 'package:stock_mate/features/language/presentation/cubits/language_cubit/language_cubit.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/language_card_widget.dart';

class LanguageCardsSection extends StatelessWidget {
  const LanguageCardsSection({super.key});
  final List<LanguageCardEntity> cardsList = const [
    LanguageCardEntity(
      languageName: "English",
      languageTagline: "Continue in English",
      code: "en",
    ),
    LanguageCardEntity(
      languageName: "العربية",
      languageTagline: "تابع بالعربية",
      code: "ar",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        final selectedCode = state is LanguageSelectedState
            ? state.selectedCode
            : null; // to get selected code from state first
        return Column(
          children: cardsList.asMap().entries.map((e) {
            var value = e.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: LanguageCardWidget(
                isSelected: selectedCode == value.code,
                languageName: value.languageName,
                languageTagline: value.languageTagline,
                onTap: (){
                  context.read<LanguageCubit>().selectLanguage(value.code);
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
