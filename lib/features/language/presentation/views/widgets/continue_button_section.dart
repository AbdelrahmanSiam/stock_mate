import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';

class ContinueButtonSection extends StatelessWidget {
  const ContinueButtonSection({
    super.key, required this.isEnabled,
  });
final bool isEnabled;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isEnabled ? 1.0 : 0.4,
      duration: Duration(milliseconds: 200),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Continue",
          style: AppStyles.buttonSemiBold15(
            context,
          ).copyWith(color: Colors.black),
        ),
      ),
    );
  }
}