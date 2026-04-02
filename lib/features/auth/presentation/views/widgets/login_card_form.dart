import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/auth_navigate_row.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/sign_in_fields.dart';
import 'package:stock_mate/generated/l10n.dart';

class LoginCardForm extends StatefulWidget {
  const LoginCardForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  
  @override
  State<LoginCardForm> createState() => _LoginCardFormState();
}

class _LoginCardFormState extends State<LoginCardForm> {
  @override
  Widget build(BuildContext context) {
    return AppCard(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      child: Column(
        children: [
          SignInFields(
            emailController: widget.emailController,
            passwordController: widget.passwordController,
          ),
          const SizedBox(height: 24),
          CustomButton(
            onPressed: () {},
            isLoading: false,
            buttonName: S.of(context).signIn,
          ),
          const SizedBox(height: 48),
          AuthNavigateRow(),
        ],
      ),
    );
  }
}
