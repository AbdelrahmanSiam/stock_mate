import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/custom_filter_chip.dart';
import 'package:stock_mate/generated/l10n.dart';

class SalesFilterTabs extends StatelessWidget {
  const SalesFilterTabs({
    super.key,
    required this.activeFilter,
    required this.onFilterChanged,
  });
  final String activeFilter;
  final ValueChanged<String> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    final filters = [
      S.of(context).today,
      S.of(context).thisWeek,
      S.of(context).thisMonth,
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((entry) {
          final label = entry;
          final bool isActive = activeFilter == label;
          return GestureDetector(
            onTap: () => onFilterChanged(label),
            child: CustomFilterChip(isActive: isActive, filterChipName: label),
          );
        }).toList(),
      ),
    );
  }
}
