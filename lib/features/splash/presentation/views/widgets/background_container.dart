import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({
    super.key,
    required this.backgroundWidth,
  });

  final double backgroundWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 4,
        width: backgroundWidth,
        color: Colors.grey.withOpacity(0.2),
      ),
    );
  }
}
