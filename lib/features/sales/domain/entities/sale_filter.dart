enum SaleFilter { today, thisWeek, thisMonth }

extension SaleFilterExtension on SaleFilter {
  DateTime get startDate {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return switch (this) {
      SaleFilter.today => today,
      SaleFilter.thisWeek => today.subtract(Duration(days: 6)),
      SaleFilter.thisMonth => DateTime(now.year, now.month, 1),
    };
  }
}
