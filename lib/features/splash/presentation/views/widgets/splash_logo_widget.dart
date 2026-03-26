import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/utils/app_assets.dart';

class SplashLogoWidget extends StatelessWidget {
  const SplashLogoWidget({
    super.key, required this.logoAnimation,
  });
final Animation <double> logoAnimation;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: logoAnimation,
      builder: (context , _) {
        return Opacity(
          opacity: logoAnimation.value,
          child: Transform.scale(
            scale: 0.8 + (logoAnimation.value * 0.2), // control on animation speed
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppAssets.logo, height: 150, width: 150),
                SizedBox(height: 20),
                Text("StockMate", style: AppStyles.appNameBold32(context)),
                SizedBox(height: 8),
                
              ],
            ),
          ),
        );
      }
    );
  }
}