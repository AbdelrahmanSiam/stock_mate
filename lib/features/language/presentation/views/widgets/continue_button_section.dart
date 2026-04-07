import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/features/language/presentation/cubits/language_cubit/language_cubit.dart';
import 'package:stock_mate/generated/l10n.dart';

class ContinueButtonSection extends StatelessWidget {
  const ContinueButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        final bool isLoading = state is LanguageSaveLoadingState;
        final selectedCode = state is LanguageSelectedState
            ? state.selectedCode
            : null;

        final bool isEnabled = selectedCode != null && !isLoading;

        return AnimatedOpacity(
          opacity: isEnabled ? 1.0 : 0.4,
          duration: const Duration(milliseconds: 200),
          child: CustomButton(
            onPressed: () {
              isEnabled
                  ? () => context.read<LanguageCubit>().confirmLanguage()
                  : null;
            },
            isLoading: isLoading,
            buttonName: S.of(context).continueButton,
          ),
        );
      },
    );
  }
}
