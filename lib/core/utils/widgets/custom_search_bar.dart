import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/barcode_widget.dart';

class CustomSearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onBarcodeScanned;
  final String hintText;
  final String barcodeScannerExtra;

  const CustomSearchBar({
    super.key,
    required this.onChanged,
    required this.onBarcodeScanned,
    required this.hintText,
    required this.barcodeScannerExtra,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: AppColorsDarkMode.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _isFocused
              ? AppColorsDarkMode.primary
              : AppColorsDarkMode.border,
          width: _isFocused ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: _isFocused
                ? AppColorsDarkMode.primary
                : AppColorsDarkMode.textSecondary,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              focusNode: _focusNode,
              onChanged: widget.onChanged,
              style: AppStyles.bodyMediumRegular14(context),
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          BarcodeWidget(
            onTap: () async {
              final String? scanned = await context.push<String>(
                AppRoutes.barcodeScanner,
                extra: widget.barcodeScannerExtra,
              );
              if (scanned != null) {
                widget.onBarcodeScanned(scanned);
              }
            },
          ),
        ],
      ),
    );
  }
}
