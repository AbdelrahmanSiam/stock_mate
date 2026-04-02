import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/login_card_form.dart';
import 'package:stock_mate/generated/l10n.dart';

class LoginCardSection extends StatelessWidget {
  const LoginCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginCardForm(),
        const SizedBox(height: 32),
        Text(
          S.of(context).orContactWith,
          style: AppStyles.captionRegular10(context),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
