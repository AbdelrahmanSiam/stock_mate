import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/back_to_login.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/containers_row.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/forget_password_header.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/forget_password_section.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomViewBody(
      widget: Column(
        children: [
          ForgetPasswordHeader(),
          const SizedBox(height: 36),
          ForgetPasswordSection(),
          const SizedBox(height: 36),
          BackToLoginWidget(),
          const SizedBox(height: 36),
          ContainersRow(),
        ],
      ),
    );
  }
}
