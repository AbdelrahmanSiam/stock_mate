import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/di/service_locator.dart';
import 'package:stock_mate/features/auth/presentation/views/email_verification_view.dart';
import 'package:stock_mate/features/auth/presentation/views/forget_password_view.dart';
import 'package:stock_mate/features/auth/presentation/views/register_view.dart';
import 'package:stock_mate/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:stock_mate/features/language/presentation/cubits/language_cubit/language_cubit.dart';
import 'package:stock_mate/features/language/presentation/views/language_view.dart';
import 'package:stock_mate/features/splash/presentation/manager/cubits/splash_cubit/splash_cubit.dart';
import 'package:stock_mate/features/splash/presentation/views/splash_view.dart';
import 'package:stock_mate/features/auth/presentation/views/login_view.dart';

// ── Route Names ──────────────────────────────────────────────
abstract class AppRoutes {
  static const String splash = '/';
  static const String language = '/language';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPassword = '/forgetPassword';
  static const String emailVerification = '/emailVerification';
  static const String dashboard = '/dashboard';
}

// ── Router Instance ───────────────────────────────────────────
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<SplashCubit>(),
        child: const SplashView(),
      ),
    ),

    GoRoute(
      path: AppRoutes.language,
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<LanguageCubit>(),
        child: const LanguageView(),
      ),
    ),

    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: AppRoutes.forgetPassword,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: AppRoutes.emailVerification,
      builder: (context, state) => const EmailVerificationView(),
    ),
    GoRoute(
      path: AppRoutes.dashboard,
      builder: (context, state) => const DashboardView(),
    ),
  ],
);
