import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
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
          child: ElevatedButton(
            onPressed: isEnabled
                ? () => context.read<LanguageCubit>().confirmLanguage()
                : null,
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    S.of(context).continueButton,
                    style: AppStyles.buttonSemiBold15(context)
                        .copyWith(color: Colors.black),
                  ),
          ),
        );
      },
    );
  }
}