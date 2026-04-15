import 'package:flutter/material.dart';
import 'package:stock_mate/features/auth/presentation/views/helper/auth_helper.dart';
import 'package:stock_mate/core/utils/widgets/custom_text_field.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/forget_password_button.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/password_toggle_icon.dart';
import 'package:stock_mate/generated/l10n.dart';

class SignInFields extends StatefulWidget {
  const SignInFields({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.extraWidget,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Widget extraWidget;
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
        CustomTextField(
          label: S.of(context).email,
          hint: "admin@gmail.com",
          prefixIcon: Icons.email_outlined,
          controller: widget.emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            return emailVerificationMethod(value, context);
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: S.of(context).password,
          hint: '••••••••',
          prefixIcon: Icons.lock_outlined,
          controller: widget.passwordController,
          obscureText: isObscureText,
          validator: (value) {
            return passwordVerificationMethod(value, context);
          },
          extraWidget: widget.extraWidget,
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
