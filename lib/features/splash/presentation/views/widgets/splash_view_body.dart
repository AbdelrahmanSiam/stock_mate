import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stock_mate/core/utils/app_assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Center(child: SvgPicture.asset(AppAssets.logo, height: 136, width: 136))],
    );
  }
}
