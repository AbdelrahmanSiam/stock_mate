import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/barcode_widget.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
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
    this.controller,
    this.focusNode,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool _isFocused = false;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(() {
      if (!mounted) return;
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
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
              controller: widget.controller,
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
