import 'package:flutter/material.dart';

class InvalidSaleId extends StatelessWidget {
  const InvalidSaleId({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: Center(child: Text('Invalid sale ID')),
    );
  }
}
