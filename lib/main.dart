import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/core/cubit/cubit/locale_cubit.dart';
import 'package:stock_mate/core/di/service_locator.dart';
import 'package:stock_mate/core/theme/theme_data/app_theme_dark_mode.dart';
import 'package:stock_mate/features/splash/presentation/manager/cubits/splash_cubit/splash_cubit.dart';
import 'package:stock_mate/features/splash/presentation/views/splash_view.dart';
import 'package:stock_mate/firebase_options.dart';
import 'package:stock_mate/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await Hive.openBox(kLanguageBox);
  setupServiceLocator();
  runApp(const StockMate());
}

class StockMate extends StatelessWidget {
  const StockMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LocaleCubit>()..loadSavedLanguage(),
        ),
        BlocProvider(create: (context) => getIt<SplashCubit>()),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          final locale = state is LocaleLoadedState
              ? state.locale
              : const Locale('ar'); // default language is arabic
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: locale,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: AppThemeDarkMode.getDarkTheme(),
            home: const SplashView(),
          );
        },
      ),
    );
  }
}
