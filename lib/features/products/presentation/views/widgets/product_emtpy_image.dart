import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class ProductEmptyImage extends StatelessWidget {
  const ProductEmptyImage({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    final isSmall = size < 70;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.camera_alt_outlined,
            color: AppColorsDarkMode.primary,
            size: isSmall ? size * 0.45 : 32,
          ),

          if (!isSmall) ...[
            const SizedBox(height: 8),

            Text(
              S.of(context).addPhoto,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.bodySmallRegular12(context),
            ),
          ],
        ],
      ),
    );
  }
}