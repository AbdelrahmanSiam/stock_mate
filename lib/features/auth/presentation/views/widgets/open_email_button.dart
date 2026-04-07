import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/generated/l10n.dart';

class OpenEmailButton extends StatelessWidget {
  const OpenEmailButton({super.key});

  Future<void> openEmailApp() async {
    // Gmail app or default email app
    final Uri emailUri = Uri(scheme: 'mailto');

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: openEmailApp,
      isLoading: false,
      buttonName: S.of(context).openEmailApp,
      color: Colors.white,
    );
  }
}