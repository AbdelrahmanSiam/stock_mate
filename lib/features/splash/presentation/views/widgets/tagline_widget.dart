import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';

class TaglineWidget extends StatelessWidget {
  const TaglineWidget({
    super.key,
    required this.taglineAnimation,
  });

  final Animation<double> taglineAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: taglineAnimation,
      builder: (context,_) {
        return Opacity(
          opacity: taglineAnimation.value,
          child: Transform.scale(
            scale: 0.8 + (taglineAnimation.value * 0.2), // control animation speed
            child: Text(
              "PREMIUM INVENTORY & SALES",
              style: AppStyles.taglineRegular11(context),
            ),
          ),
        );
      }
    );
  }
}
