import 'package:flutter/material.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/login_card_form.dart';
import 'package:stock_mate/generated/l10n.dart';

class LoginCardSection extends StatefulWidget {
  const LoginCardSection({super.key});

  @override
  State<LoginCardSection> createState() => _LoginCardFormState();
}

class _LoginCardFormState extends State<LoginCardSection> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? emailError;
  String? passwordError;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool validate() {
    String? emailErr;
    String? passwordErr;

    if (emailController.text.trim().isEmpty) {
      emailErr = S.of(context).fieldRequired;
    } else if (!RegExp(
      r'^[^@]+@[^@]+\.[^@]+',
    ).hasMatch(emailController.text.trim())) {
      emailErr = S.of(context).invalidEmail;
    }

    if (passwordController.text.isEmpty) {
      passwordErr = S.of(context).fieldRequired;
    } else if (passwordController.text.length < 6) {
      passwordErr = S.of(context).invalidPassword;
    }

    setState(() {
      emailErr = emailErr;
      passwordErr = passwordErr;
    });

    // if both are null so validate is ok
    return emailErr == null && passwordErr == null;
  }

  @override
  Widget build(BuildContext context) {
    return LoginCardForm(
      emailController: emailController,
      passwordController: passwordController,
    );
  }
}
