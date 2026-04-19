import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';

class ScannerHintWidget extends StatelessWidget {
  final String hint;
  const ScannerHintWidget({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        hint,
        style: AppStyles.bodyMediumRegular14(
          context,
        ).copyWith(color: Colors.white70),
        textAlign: TextAlign.center,
      ),
    );
  }
}
