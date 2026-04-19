import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';
import 'widgets/scan_overlay_widget.dart';
import 'widgets/scanner_hint_widget.dart';

// context determine behavior after scan :
// 'product' → from Add/Edit Product (fill barcode field)
// 'search'  → from Products List (filter using barcode )
class BarcodeScannerView extends StatefulWidget {
  final String scanContext;
  const BarcodeScannerView({super.key, required this.scanContext});

  @override
  State<BarcodeScannerView> createState() => _BarcodeScannerViewState();
}

class _BarcodeScannerViewState extends State<BarcodeScannerView> {
  final MobileScannerController controller = MobileScannerController(
    formats: [
      BarcodeFormat.qrCode,
      BarcodeFormat.code128,
      BarcodeFormat.code39,
      BarcodeFormat.ean13,
      BarcodeFormat.ean8,
      BarcodeFormat.upcA,
      BarcodeFormat.upcE,
    ],
  );

  //  To avoid multi scan if use click quickly
  bool hasScanned = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onDetect(BarcodeCapture capture) {
    if (hasScanned) return;

    final String? rawValue = capture.barcodes.firstOrNull?.rawValue;
    if (rawValue == null || rawValue.isEmpty) return;

    setState(() => hasScanned = true);

    // stop camera
    controller.stop();

    // return value for screen
    // context.pop(value) send value for awaiting push
    context.pop(rawValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => context.pop(null),
        ),
        title: Text(
          S.of(context).scanBarcode,
          style: AppStyles.sectionTitleSemiBold16(
            context,
          ).copyWith(color: Colors.white),
        ),
        actions: [
          ValueListenableBuilder(
            valueListenable: controller,
            builder: (_, value, __) => IconButton(
              icon: Icon(
                value.torchState == TorchState.on
                    ? Icons.flash_on_rounded
                    : Icons.flash_off_rounded,
                color: value.torchState == TorchState.on
                    ? AppColorsDarkMode.primary
                    : Colors.white,
              ),
              onPressed: () => controller.toggleTorch(),
            ),
          ),
          // Camera flip
          IconButton(
            icon: const Icon(
              Icons.flip_camera_ios_outlined,
              color: Colors.white,
            ),
            onPressed: () => controller.switchCamera(),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(controller: controller, onDetect: onDetect),
          const ScanOverlayWidget(),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: ScannerHintWidget(
                hint: widget.scanContext == S.of(context).products
                    ? S.of(context).pointAtProductBarcode
                    : S.of(context).pointAtBarcodeToSearch,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
