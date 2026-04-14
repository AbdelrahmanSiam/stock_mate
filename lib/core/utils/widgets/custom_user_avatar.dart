import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

class CustomUserAvatar extends StatelessWidget {
  const CustomUserAvatar({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColorsDarkMode.surface,
            border: Border.all(color: AppColorsDarkMode.border, width: 1),
          ),
          child: Center(
            child: Text(
              state is AuthSuccessState && state.user.displayName.isNotEmpty
                  ? state.user.displayName[0].toUpperCase()
                  : '0',
              style: AppStyles.sectionTitleSemiBold16(
                context,
              ).copyWith(color: AppColorsDarkMode.primary),
            ),
          ),
        );
      },
    );
  }
}
