import 'package:flutter/material.dart';
import 'package:stock_mate/features/splash/presentation/views/widgets/app_logo_widget.dart';

class SplashLogoWidget extends StatelessWidget {
  const SplashLogoWidget({super.key, required this.logoAnimation});
  final Animation<double> logoAnimation;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: logoAnimation,
      builder: (context, _) {
        return Opacity(
          opacity: logoAnimation.value,
          child: Transform.scale(
            scale:
                0.8 + (logoAnimation.value * 0.2), // control on animation speed
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppLogoWidget(
                  iconHeight: 90,
                  iconWidth: 90,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
