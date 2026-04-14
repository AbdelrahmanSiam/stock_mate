import 'package:flutter/material.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Products View",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}