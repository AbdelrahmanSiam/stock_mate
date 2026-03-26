import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/theme_data/app_theme_dark_mode.dart';
import 'package:stock_mate/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const StockMate());
}

class StockMate extends StatelessWidget {
  const StockMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeDarkMode.getDarkTheme(),
      home: const SplashView(),
    );
  }
}
