import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/new_sale_skeleton_widget.dart';

class NewSaleInitialBody extends StatelessWidget {
  const NewSaleInitialBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar disabled
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Skeletonizer(
            enabled: true,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColorsDarkMode.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColorsDarkMode.border),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Expanded(child: NewSaleSkeletonWidget()),
      ],
    );
  }
}
