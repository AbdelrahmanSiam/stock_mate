import 'package:flutter/material.dart';
import 'package:stock_mate/features/auth/presentation/views/helper/auth_helper.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/forget_password_button.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/password_toggle_icon.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/sign_in_fields.dart';
import 'package:stock_mate/generated/l10n.dart';

class RegisterFields extends StatefulWidget {
  const RegisterFields({
    super.key,
    required this.shopController,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController shopController;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  State<RegisterFields> createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAuthTextField(
          label: S.of(context).shopeName,
          hint: S.of(context).shopNameExample,
          prefixIcon: Icons.store_outlined,
          controller: widget.shopController,
          validator: (value) {
            return fieldRequiredVerification(value, context);
          },
        ),
        const SizedBox(height: 16),
        CustomAuthTextField(
          label: S.of(context).fullName,
          hint: S.of(context).fullNameExample,
          prefixIcon: Icons.person_outline,
          controller: widget.nameController,
          validator: (value) {
            return fieldRequiredVerification(value, context);
          },
        ),
        const SizedBox(height: 16),
        SignInFields(
          emailController: widget.emailController,
          passwordController: widget.passwordController,
        ),
        const SizedBox(height: 16),
        CustomAuthTextField(
          label: S.of(context).password,
          hint: '••••••••',
          prefixIcon: Icons.lock_outlined,
          controller: widget.confirmPasswordController,
          obscureText: isObscureText,
          validator: (value) => value != widget.passwordController.text
              ? S.of(context).passwordNotMatch
              : null,
          extraWidget: ForgetPasswordButton(),
          suffixIcon: PasswordToggleIcon(
            isObscure: isObscureText,
            onTap: () {
              setState(() {
                isObscureText = !isObscureText;
              });
            },
          ),
        ),
      ],
    );
  }
}
