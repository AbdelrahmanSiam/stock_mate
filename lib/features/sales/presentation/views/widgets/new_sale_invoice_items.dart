import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sale_cubit/sale_cubit.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/invoice_item_row.dart';

class NewSaleInvoiceItems extends StatelessWidget {
  const NewSaleInvoiceItems({super.key, required this.itemsList});
  final List<InvoiceItemEntity> itemsList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: itemsList.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (_, index) {
        final item = itemsList[index];
        return InvoiceItemRow(
          item: item,
          onIncrement: () =>
              context.read<SaleCubit>().incrementItem(item.productId),
          onDecrement: () =>
              context.read<SaleCubit>().decrementItem(item.productId),
          onRemove: () => context.read<SaleCubit>().removeItem(item.productId),
        );
      },
    );
  }
}
