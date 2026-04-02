import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/utils/widgets/app_logo.dart';
import 'package:stock_mate/generated/l10n.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key, required this.iconHeight, required this.iconWidth, required this.iconColor,
  });
  final double iconHeight , iconWidth ;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AppLogo(iconHeight: iconHeight, iconWidth: iconWidth, iconColor: iconColor),
          const SizedBox(height: 16),
          Text(S.of(context).appName, style: AppStyles.appNameBold32(context)),
        ],
      ),
    );
  }
}