import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/email_verification_header.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/email_verification_view_icon.dart';
import 'package:stock_mate/generated/l10n.dart';

class EmailVerificationViewBody extends StatelessWidget {
  const EmailVerificationViewBody({super.key, required this.enteredEmail});
  final String enteredEmail;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        EmailVerificationIcon(),
        const SizedBox(height: 28),
        EmailVerificationHeader(enteredEmail: enteredEmail),
      ],
    );
  }
}
