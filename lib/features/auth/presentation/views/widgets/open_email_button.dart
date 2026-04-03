import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/generated/l10n.dart';

class OpenEmailButton extends StatelessWidget {
  const OpenEmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        // open email App
      },
      isLoading: false,
      buttonName: S.of(context).openEmailApp,
      color: Colors.white,
    );
  }
}
