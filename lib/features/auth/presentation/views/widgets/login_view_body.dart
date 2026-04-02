import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/login_card_section.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/login_view_header.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/social_sign_in_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomViewBody(
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LoginViewHeader(),
          const SizedBox(height: 32),
          LoginCardSection(),
          const SizedBox(height: 20),
          SocialSignInButton(icon: Icons.g_mobiledata),
        ],
      ),
    );
  }
}
