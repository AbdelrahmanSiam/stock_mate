import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/utils/app_assets.dart';
import 'package:stock_mate/generated/l10n.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key, required this.iconHeight, required this.iconWidth,
  });
 final double iconHeight , iconWidth;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(AppAssets.logo, height: iconHeight, width: iconWidth),
          Text(S.of(context).app_name, style: AppStyles.appNameBold32(context)),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}