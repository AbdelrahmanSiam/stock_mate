import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sales_filter_tabs.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sales_history_transaction_volume_section.dart';
import 'package:stock_mate/generated/l10n.dart';

class SalesHistoryViewBody extends StatelessWidget {
  const SalesHistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SalesFilterTabs(
            activeFilter: S.of(context).thisWeek,
            onFilterChanged: (value) {},
          ),
          const SizedBox(height: 20),
          AppCard(
            child: Row(
              children: [SalesHistoryTransactionVolumeSection(totalSales: 24)],
            ),
          ),
        ],
      ),
    );
  }
}
