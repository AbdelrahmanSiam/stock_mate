import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/custom_filter_chip.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_filter.dart';
import 'package:stock_mate/generated/l10n.dart';

class SalesFilterTabs extends StatelessWidget {
  const SalesFilterTabs({
    super.key,
    required this.activeFilter,
    required this.onFilterChanged,
  });
  final SaleFilter activeFilter;
  final ValueChanged<SaleFilter> onFilterChanged;

  @override
  Widget build(BuildContext context) {
    final filters = [
      (SaleFilter.today, S.of(context).today),
      (SaleFilter.thisWeek, S.of(context).thisWeek),
      (SaleFilter.thisMonth, S.of(context).thisMonth),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((entry) {
          final (filter, label) = entry;
          final bool isActive = activeFilter == filter;
          return GestureDetector(
            onTap: () => onFilterChanged(filter),
            child: CustomFilterChip(isActive: isActive, filterChipName: label),
          );
        }).toList(),
      ),
    );
  }
}
