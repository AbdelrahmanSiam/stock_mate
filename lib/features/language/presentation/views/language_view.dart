import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/language/presentation/cubits/language_cubit/language_cubit.dart';
import 'package:stock_mate/features/language/presentation/views/widgets/language_view_body.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LanguageCubit, LanguageState>(
        listener: (context, state) {
          if (state is LanguageSaveSuccessState) {
            context.go(AppRoutes.language);
          } else if (state is LanguageSaveFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
                backgroundColor: AppColorsDarkMode.error,
              ),
            );
          }
        },
        child: LanguageViewBody(),
      ),
    );
  }
}
