import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/features/language/presentation/cubits/language_cubit/language_cubit.dart';

class ContinueButtonSection extends StatelessWidget {
  ContinueButtonSection({super.key});
  late bool isEnabled;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isEnabled ? 1.0 : 0.4,
      duration: Duration(milliseconds: 200),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          final bool isLoading = state is LanguageSaveLoadingState;
          final selectedCode = state is LanguageSelectedState
              ? state.selectedCode
              : null;
          // disabled if no choice to save
          isEnabled = selectedCode != null && !isLoading;
          return ElevatedButton(
            onPressed: isEnabled
                ? () => context.read<LanguageCubit>().confirmLanguage()
                : null,
            child: state is LanguageSaveLoadingState
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    selectedCode == "ar" ? " متابعه" : "Continue",
                    style: AppStyles.buttonSemiBold15(
                      context,
                    ).copyWith(color: Colors.black),
                  ),
          );
        },
      ),
    );
  }
}
