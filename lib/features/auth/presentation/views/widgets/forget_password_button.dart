import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/generated/l10n.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // enter new password from gmail
      },
      child: Text(
        S.of(context).forgetPassword,
        style: AppStyles.priceBold16(context),
      ),
    );
  }
}