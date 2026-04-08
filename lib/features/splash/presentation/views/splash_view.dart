import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/cubit/cubit/locale_cubit.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/features/splash/presentation/manager/cubits/splash_cubit/splash_cubit.dart';
import 'package:stock_mate/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          // Wait for locale to be loaded before navigating
          final localeState = context.read<LocaleCubit>().state;
          // Only navigate if locale is loaded AND auth state has changed
          if (localeState is! LocaleLoadedState) {
            debugPrint('⏳ Waiting for locale to load...');
            return;
          }
          if (state is SplashAuthenticatedState) {
            context.go(AppRoutes.dashboard);
          } else if (state is SplashUnauthenticatedState) {
            context.go(AppRoutes.login);
          }
        },
        child: SplashViewBody(),
      ),
    );
  }
}
