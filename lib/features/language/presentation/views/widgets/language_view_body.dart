import 'package:flutter/material.dart';
import 'package:stock_mate/features/splash/presentation/views/widgets/app_logo_widget.dart';

class LanguageViewBody extends StatelessWidget {
  const LanguageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppLogoWidget(),
      ],
    );
  }
}