import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/cubit/cubit/locale_cubit.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/features/splash/presentation/manager/cubits/splash_cubit/splash_cubit.dart';
import 'package:stock_mate/features/splash/presentation/views/widgets/loading_bar_widget.dart';
import 'package:stock_mate/features/splash/presentation/views/widgets/splash_logo_widget.dart';
import 'package:stock_mate/features/splash/presentation/views/widgets/tagline_widget.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late final AnimationController logoController;
  late final AnimationController taglineController;
  late final AnimationController loadingBarController;

  late final Animation<double> logoAnimation;
  late final Animation<double> taglineAnimation;
  late final Animation<double> loadingBarAnimation;

  bool hasNavigated = false;
  Timer? navigationTimer;

  // constants for timing configuration
  static const int minSplashDurationMs = 2500;
  static const int authCheckTimeoutMs = 5000;

  @override
  void initState() {
    super.initState();
    initAnimations();
    // Method for properly coordinate locale loading, auth check, and navigation
    coordinateInitialization();
  }

  void initAnimations() {
    logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    taglineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    loadingBarController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    logoAnimation = CurvedAnimation(
      parent: logoController,
      curve: Curves.easeOut,
    );
    taglineAnimation = CurvedAnimation(
      parent: taglineController,
      curve: Curves.easeOut,
    );
    loadingBarAnimation = CurvedAnimation(
      parent: loadingBarController,
      curve: Curves.linear,
    );
    logoController.forward();
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) taglineController.forward();
    });
    loadingBarController.repeat();
  }

  // Coordinate initialization properly
  void coordinateInitialization() {
    // Start auth check immediately but with timeout
    startAuthCheckWithTimeout();
    navigationTimer = Timer(
      const Duration(milliseconds: minSplashDurationMs),
      handleNavigation,
    );
  }

  void startAuthCheckWithTimeout() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        context.read<SplashCubit>().checkAuthentication();
      }
    }).timeout(
      const Duration(milliseconds: authCheckTimeoutMs),
      onTimeout: () {
        if (mounted) {
          debugPrint('⚠️ Auth check timeout, defaulting to login');
        }
      },
    );
  }

  // Handle navigation with proper state checking
  void handleNavigation() {
    if (!hasNavigated && mounted) {
      hasNavigated = true;
      final localeState = context.read<LocaleCubit>().state;
      // Check if this is first time user
      if (localeState is LocaleInitialState) {
        // First time user - go to language selection
        context.go(AppRoutes.language);
      }
      // Otherwise, SplashCubit's BlocListener will handle auth state navigation
    }
  }

  @override
  void dispose() {
    navigationTimer?.cancel();
    logoController.dispose();
    taglineController.dispose();
    loadingBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SplashLogoWidget(logoAnimation: logoAnimation),
              TaglineWidget(taglineAnimation: taglineAnimation),
            ],
          ),
        ),
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: LoadingBarWidget(loadingBarAnimation: loadingBarAnimation),
        ),
      ],
    );
  }
}
