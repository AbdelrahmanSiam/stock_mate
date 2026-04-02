import 'package:flutter/material.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/login_card_form.dart';

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
        const SizedBox(height: 24),
        
      ],
    );
  }
}
