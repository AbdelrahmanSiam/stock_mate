// lib/core/widgets/app_card.dart

import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  // Gradient options
  final bool useGradient;
  final List<Color>? gradientColors;

  // card without gradient
  final Color? backgroundColor;

  // Border
  final Color? borderColor;
  final double borderWidth;
  final List<double>? stops;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius = 16,
    this.useGradient = false,
    this.gradientColors,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1, this.stops,
  });

  @override
  Widget build(BuildContext context) {
    // If gradient use gradient background if not use default
    final List<Color> colors =
        gradientColors ??
        [AppColorsDarkMode.surface, AppColorsDarkMode.surface];

    return Container(
      padding: padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: useGradient
            ? LinearGradient(
                // vertical
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: colors,
                stops: stops
              )
            : null,
        color: useGradient
            ? null
            : (backgroundColor ?? AppColorsDarkMode.surface),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? AppColorsDarkMode.border,
          width: borderWidth,
        ),
      ),
      child: child,
    );
  }
}
