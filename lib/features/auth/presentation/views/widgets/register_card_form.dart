import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/register_field.dart';
import 'package:stock_mate/generated/l10n.dart';

class RegisterCardForm extends StatefulWidget {
  const RegisterCardForm({super.key});

  @override
  State<RegisterCardForm> createState() => _RegisterCardFormState();
}

class _RegisterCardFormState extends State<RegisterCardForm> {
  final shopController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    shopController.dispose();
    nameController.dispose();
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
            RegisterFields(
              shopController: shopController,
              nameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
          ),
            const SizedBox(height: 16),
            const SizedBox(height: 24),
            CustomButton(
              buttonName: S.of(context).registerButton,
              isLoading: false,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // register logic
                }
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
