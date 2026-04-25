import 'package:flutter/material.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/new_sale_view_body.dart';

class NewSaleView extends StatelessWidget {
  const NewSaleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  NewSaleViewBody(),
    );
  }
}