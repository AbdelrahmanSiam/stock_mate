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

  @override
  void initState() {
    super.initState();
    initAnimations();
    startNavigation();
    startAuthCheck();
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

  void startNavigation() {
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (!hasNavigated && mounted) {
        hasNavigated = true;
        final localeState = context
            .read<LocaleCubit>()
            .state; // get current state to check it
        if (localeState is LocaleInitialState) {
          // this is first time to visit app so go to language View
          context.go(AppRoutes.language);
        }
      }
    });
  }

  void startAuthCheck() {
    context.read<SplashCubit>().checkAuthentication();
  }

  @override
  void dispose() {
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
              TaglineWidget(
                taglineAnimation: taglineAnimation,
              ), // late 800 ms than Logo and App name
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
