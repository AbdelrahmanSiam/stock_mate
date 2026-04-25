import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class PaymentMethodSelector extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;

  const PaymentMethodSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final methods = [
      (S.of(context).cash, Icons.payments_outlined),
      (S.of(context).visa, Icons.credit_card_outlined),
    ];

    return Row(
      children: methods.map((entry) {
        final (label, icon) = entry;
        final bool isActive = selected == label;

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => onChanged(label),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColorsDarkMode.primary.withValues(alpha: 0.15)
                      : AppColorsDarkMode.border.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isActive
                        ? AppColorsDarkMode.primary
                        : Colors.transparent,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 18,
                      color: isActive
                          ? AppColorsDarkMode.primary
                          : AppColorsDarkMode.textSecondary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      label,
                      style: AppStyles.bodySmallRegular12(context).copyWith(
                        color: isActive
                            ? AppColorsDarkMode.primary
                            : AppColorsDarkMode.textSecondary,
                        fontWeight: isActive
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
