import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/forget_password_header.dart';
import 'package:stock_mate/generated/l10n.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomViewBody(
      widget: Column(
        children: [
          ForgetPasswordHeader(),
        ],
      ),
    );
  }
}
