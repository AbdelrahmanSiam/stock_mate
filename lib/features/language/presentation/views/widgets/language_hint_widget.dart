import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';

class LanguageHintWidget extends StatelessWidget {
  const LanguageHintWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'You can change this later in Settings',
          style: AppStyles.bodySmallRegular12(context),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          'يمكنك تغيير هذا لاحقاً من الإعدادات',
          style: AppStyles.bodySmallRegular12(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}