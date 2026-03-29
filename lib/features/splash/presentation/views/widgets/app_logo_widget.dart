import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/utils/app_assets.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(AppAssets.logo, height: 120, width: 120),
          SizedBox(height: 20),
          Text("StockMate", style: AppStyles.appNameBold32(context)),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}