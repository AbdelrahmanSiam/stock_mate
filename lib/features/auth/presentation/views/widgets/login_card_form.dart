import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/auth_navigate_row.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/sign_in_fields.dart';
import 'package:stock_mate/generated/l10n.dart';

class LoginCardForm extends StatefulWidget {
  const LoginCardForm({super.key});

  @override
  State<LoginCardForm> createState() => _LoginCardFormState();
}

class _LoginCardFormState extends State<LoginCardForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AppCard(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        child: Column(
          children: [
            SignInFields(
              emailController: emailController,
              passwordController: passwordController,
            ),
            const SizedBox(height: 24),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Navigate to Dashboard
                }
              },
              isLoading: false,
              buttonName: S.of(context).signIn,
            ),
            const SizedBox(height: 48),
            AuthNavigateRow(),
          ],
        ),
      ),
    );
  }
}
