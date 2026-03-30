import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';

class ContinueButtonSection extends StatelessWidget {
  const ContinueButtonSection({
    super.key, required this.isEnabled, required this.code,
  });
final bool isEnabled;
final String code;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isEnabled ? 1.0 : 0.4,
      duration: Duration(milliseconds: 200),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          code == "ar" ? " متابعه" : "Continue",
          style: AppStyles.buttonSemiBold15(
            context,
          ).copyWith(color: Colors.black),
        ),
      ),
    );
  }
}