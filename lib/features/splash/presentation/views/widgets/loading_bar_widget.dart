import 'package:flutter/material.dart';
import 'package:stock_mate/features/splash/presentation/views/widgets/background_container.dart';
import 'package:stock_mate/features/splash/presentation/views/widgets/foreground_animated_controller.dart';

class LoadingBarWidget extends StatelessWidget {
  const LoadingBarWidget({
    super.key,
    required this.loadingBarAnimation,
  });

  final Animation<double> loadingBarAnimation;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final backgroundWidth = width * 0.7;
    final barWidth = width * 0.2;
    final startX = (width - backgroundWidth) / 2;
    return AnimatedBuilder(
      animation: loadingBarAnimation,
      builder: (context,_) {
        return Stack(
          children: [
            BackgroundContainer(backgroundWidth: backgroundWidth),
            Transform.translate(
              offset: Offset(
                startX + ((backgroundWidth - barWidth) * loadingBarAnimation.value),
                0,
              ),
              child: ForegroundAnimatedController(width: width),
            ),
          ],
        );
      }
    );
  }
}
