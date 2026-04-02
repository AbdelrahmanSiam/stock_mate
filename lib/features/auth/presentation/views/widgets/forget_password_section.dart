import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/features/auth/presentation/views/helper/auth_helper.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:stock_mate/generated/l10n.dart';

class ForgetPasswordSection extends StatefulWidget {
  const ForgetPasswordSection({super.key});

  @override
  State<ForgetPasswordSection> createState() => _ForgetPasswordSectionState();
}

class _ForgetPasswordSectionState extends State<ForgetPasswordSection> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomAuthTextField(
            label: S.of(context).email,
            labelColor: AppColorsDarkMode.primary,
            hint: "admin@gmail.com",
            prefixIcon: Icons.email,
            controller: emailController,
            validator: (value) {
              return emailVerificationMethod(value, context);
            },
          ),
          const SizedBox(height: 28),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // send reset password email
              }
            },
            isLoading: false,
            buttonName: S.of(context).sendResetLink,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
