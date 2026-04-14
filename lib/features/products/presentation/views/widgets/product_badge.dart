import 'package:flutter/material.dart';

class ProductBadge extends StatelessWidget {
  const ProductBadge({
    super.key,
    required this.label,
    required this.bg,
    required this.border,
    required this.textColor,
  });
  final String label;
  final Color bg, border, textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: border, width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: textColor,
          fontFamily: 'Inter',
        ),
      ),
    );
  }
}
