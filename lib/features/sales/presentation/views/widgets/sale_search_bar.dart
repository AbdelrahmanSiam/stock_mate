import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/utils/widgets/custom_search_bar.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sale_cubit/sale_cubit.dart';
import 'package:stock_mate/generated/l10n.dart';

class SaleSearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onBarcodeScanned;

  const SaleSearchBar({
    super.key,
    required this.onChanged,
    required this.onBarcodeScanned,
  });

  @override
  State<SaleSearchBar> createState() => _SaleSearchBarState();
}

class _SaleSearchBarState extends State<SaleSearchBar> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SaleCubit, SaleState>(
      listenWhen: (previous, current) {
        if (previous is SaleItemsUpdatedState &&
            current is SaleItemsUpdatedState) {
          return previous.searchResults.isNotEmpty &&
              current.searchResults.isEmpty;
        }
        return false;
      },
      listener: (context, state) {
        _controller.clear();
        _focusNode.unfocus();
      },
      child: CustomSearchBar(
        onChanged: widget.onChanged,
        onBarcodeScanned: widget.onBarcodeScanned,
        hintText: S.of(context).searchProductOrSku,
        barcodeScannerExtra: "sale",
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }
}
