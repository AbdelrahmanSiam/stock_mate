import 'package:flutter/material.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_success_view_body.dart';

class SaleSuccessView extends StatelessWidget {
  const SaleSuccessView({super.key, required this.sale});
  final SaleEntity sale;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(body: SaleSuccessViewBody(sale: sale,)));
  }
}
