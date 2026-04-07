import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/back_to_login.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/email_verification_container.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/email_verification_header.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/email_verification_view_icon.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/open_email_button.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/resend_email_verification_widget.dart';

class EmailVerificationViewBody extends StatelessWidget {
  const EmailVerificationViewBody({super.key, required this.enteredEmail});
  final String enteredEmail;
  @override
  Widget build(BuildContext context) {
    return CustomViewBody(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EmailVerificationIcon(),
          const SizedBox(height: 36),
          EmailVerificationHeader(enteredEmail:enteredEmail),
          const SizedBox(height: 36),
          OpenEmailButton(),
          const SizedBox(height: 36),
          BackToLoginWidget(),
          const SizedBox(height: 60),
          ResendEmailVerificationWidget(),
          const Spacer(),
          EmailVerificationContainer(),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
