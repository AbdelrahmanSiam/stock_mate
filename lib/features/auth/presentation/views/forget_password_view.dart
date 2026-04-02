import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/forget_password_view_body.dart';
import 'package:stock_mate/generated/l10n.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(S.of(context).appName, style: AppStyles.h2Bold22(context)),
      ),
      body: ForgetPasswordViewBody(),
    );
  }
}
