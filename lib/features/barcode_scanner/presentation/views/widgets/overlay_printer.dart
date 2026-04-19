import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class OverlayPainter extends CustomPainter {
  final double scanSize;
  const OverlayPainter({required this.scanSize});

  @override
  void paint(Canvas canvas, Size size) {
    final darkPaint = Paint()..color = Colors.black.withValues(alpha:0.6);

    final Rect scanRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: scanSize,
      height: scanSize,
    );

    // overlay with hole in the middle
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
        Path()..addRRect(
          RRect.fromRectAndRadius(scanRect, const Radius.circular(12)),
        ),
      ),
      darkPaint,
    );

    // ── Orange corners ────────────────────────────────
    final cornerPaint = Paint()
      ..color       = AppColorsDarkMode.primary
      ..strokeWidth = 3
      ..style       = PaintingStyle.stroke
      ..strokeCap   = StrokeCap.round;

    const double cLen = 24; // corner length

    // Top-left
    canvas.drawLine(scanRect.topLeft,
        scanRect.topLeft + const Offset(cLen, 0), cornerPaint);
    canvas.drawLine(scanRect.topLeft,
        scanRect.topLeft + const Offset(0, cLen), cornerPaint);

    // Top-right
    canvas.drawLine(scanRect.topRight,
        scanRect.topRight + const Offset(-cLen, 0), cornerPaint);
    canvas.drawLine(scanRect.topRight,
        scanRect.topRight + const Offset(0, cLen), cornerPaint);

    // Bottom-left
    canvas.drawLine(scanRect.bottomLeft,
        scanRect.bottomLeft + const Offset(cLen, 0), cornerPaint);
    canvas.drawLine(scanRect.bottomLeft,
        scanRect.bottomLeft + const Offset(0, -cLen), cornerPaint);

    // Bottom-right
    canvas.drawLine(scanRect.bottomRight,
        scanRect.bottomRight + const Offset(-cLen, 0), cornerPaint);
    canvas.drawLine(scanRect.bottomRight,
        scanRect.bottomRight + const Offset(0, -cLen), cornerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}