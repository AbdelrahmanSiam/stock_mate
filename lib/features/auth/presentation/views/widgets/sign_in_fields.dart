import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/forget_password_button.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/password_toggle_icon.dart';
import 'package:stock_mate/generated/l10n.dart';

class SignInFields extends StatefulWidget {
  const SignInFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  @override
  State<SignInFields> createState() => _SignInFieldsState();
}

class _SignInFieldsState extends State<SignInFields> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAuthTextField(
          label: S.of(context).email,
          hint: "mohamed@gmail.com",
          prefixIcon: Icons.email_outlined,
          controller: widget.emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            return emailVerificationMethod(value, context);
          },
        ),
        const SizedBox(height: 16),
        CustomAuthTextField(
          label: S.of(context).password,
          hint: '••••••••',
          prefixIcon: Icons.lock_outlined,
          controller: widget.passwordController,
          obscureText: isObscureText,
          validator: (value) {
            return passwordVerificationMethod(value, context);
          },
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

  String? passwordVerificationMethod(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).fieldRequired;
    }
    if (value.length < 6) {
      return S.of(context).invalidPassword;
    }

    return null;
  }

  String? emailVerificationMethod(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).fieldRequired;
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) {
      return S.of(context).invalidEmail;
    }
    return null;
  }
}
