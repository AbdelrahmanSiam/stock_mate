import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sales_history_view_body.dart';
import 'package:stock_mate/generated/l10n.dart';

class SalesHistoryView extends StatelessWidget {
  const SalesHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).salesHistory,
          style: AppStyles.priceBold16(context),
        ),
      ),
      body: SalesHistoryViewBody(),
    );
  }
}
