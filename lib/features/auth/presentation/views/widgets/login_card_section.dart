import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/login_card_form.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/social_sign_in_button.dart';
import 'package:stock_mate/generated/l10n.dart';

class LoginCardSection extends StatefulWidget {
  const LoginCardSection({super.key});

  @override
  State<LoginCardSection> createState() => _LoginCardFormState();
}

class _LoginCardFormState extends State<LoginCardSection> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginCardForm(
          emailController: emailController,
          passwordController: passwordController,
        ),
        const SizedBox(height: 32),
        Text(
          S.of(context).orContactWith,
          style: AppStyles.captionRegular10(context),
        ),
        const SizedBox(height: 16),
        SocialSignInButton(icon: Icons.g_mobiledata),
      ],
    );
  }
}
