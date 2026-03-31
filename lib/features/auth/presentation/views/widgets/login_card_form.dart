import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:stock_mate/generated/l10n.dart';

class LoginCardForm extends StatefulWidget {
  const LoginCardForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.emailError,
    this.passwordError,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? emailError;
  final String? passwordError;
  @override
  State<LoginCardForm> createState() => _LoginCardFormState();
}

class _LoginCardFormState extends State<LoginCardForm> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      child: Column(
        children: [
          CustomAuthTextField(
            label: S.of(context).email,
            hint: "mohamed@gmail.com",
            prefixIcon: Icons.email_outlined,
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            errText: widget.emailError,
          ),
          const SizedBox(height: 16),
          CustomAuthTextField(
            label: S.of(context).password,
            hint: '••••••••',
            prefixIcon: Icons.lock_outlined,
            controller: widget.passwordController,
            obscureText: isObscureText,
            errText: widget.passwordError,
            widget: Text("Forget?", style: AppStyles.priceBold16(context)),
            suffixIcon: GestureDetector(
              onTap: (){
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
