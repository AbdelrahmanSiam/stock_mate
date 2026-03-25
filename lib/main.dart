import 'package:flutter/material.dart';
import 'package:stock_mate/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const StockMate());
}

class StockMate extends StatelessWidget {
  const StockMate({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}