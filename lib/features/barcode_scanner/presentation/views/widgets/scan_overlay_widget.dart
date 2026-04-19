import 'package:flutter/material.dart';
import 'package:stock_mate/features/barcode_scanner/presentation/views/widgets/overlay_printer.dart';

class ScanOverlayWidget extends StatelessWidget {
  const ScanOverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double scanSize = MediaQuery.sizeOf(context).width * 0.7;

    return CustomPaint(
      size: MediaQuery.sizeOf(context),
      painter: OverlayPainter(scanSize: scanSize),
    );
  }
}
