import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/email_verification_view_body.dart';
import 'package:stock_mate/generated/l10n.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          S.of(context).appName,
          style: AppStyles.h2Bold22(
            context,
          ).copyWith(color: AppColorsDarkMode.primary),
        ),
      ),
      body: EmailVerificationViewBody(),
    );
  }
}
