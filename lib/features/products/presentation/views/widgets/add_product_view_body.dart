import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_snack_bar.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/core/utils/widgets/custom_text_field.dart';
import 'package:stock_mate/features/auth/presentation/views/helper/auth_helper.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/products/presentation/manager/cubits/add_edit_product_cubit/add_edit_product_cubit.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/barcode_widget.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/delete_product_button.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_image_picker_widget.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_prices_section.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_stock_section.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/profit_card_widget.dart';
import 'package:stock_mate/generated/l10n.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody(this.product, {super.key});
  final ProductEntity? product;
  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController sellPriceController = TextEditingController();
  final TextEditingController buyPriceController = TextEditingController();
  final TextEditingController thresholdController = TextEditingController();
  int quantity = 0;
  double sellPrice = 0.0;
  double buyPrice = 0.0;
  File? selectedImage;
  String currentImageUrl = '';
  bool get isEditMode => widget.product != null;

  @override
  void initState() {
    initControllers();
    super.initState();
  }

  void initControllers() {
    if (isEditMode) {
      final p = widget.product!;
      nameController.text = p.name;
      barcodeController.text = p.barcode;
      categoryController.text = p.category;
      buyPriceController.text = p.buyPrice.toString();
      sellPriceController.text = p.sellPrice.toString();
      thresholdController.text = p.threshold.toString();
      quantity = p.quantity;
      currentImageUrl = p.imageUrl;
      buyPrice = p.buyPrice;
      sellPrice = p.sellPrice;
    } else {
      thresholdController.text = '5';
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    categoryController.dispose();
    barcodeController.dispose();
    sellPriceController.dispose();
    buyPriceController.dispose();
    thresholdController.dispose();
    super.dispose();
  }

  void onSave() {
    if (!formKey.currentState!.validate()) return;
    context.read<AddEditProductCubit>().saveProduct(
      existingId: widget.product?.id,
      name: nameController.text.trim(),
      barcode: barcodeController.text.trim(),
      category: categoryController.text.trim(),
      buyPrice: double.tryParse(buyPriceController.text) ?? 0,
      sellPrice: double.tryParse(sellPriceController.text) ?? 0,
      quantity: quantity,
      threshold: int.tryParse(thresholdController.text) ?? 5,
      imageUrl: currentImageUrl,
      oldImageUrl: widget.product?.imageUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddEditProductCubit, AddEditProductState>(
      listener: (context, state) {
        if (state is AddEditProductImageUploadedState) {
          setState(() => currentImageUrl = state.imageUrl);
        } else if (state is AddEditProductSavedState) {
          AppSnackBar.show(
            context,
            message: S.of(context).productSaved,
            type: SnackBarType.success,
          );
          context.pop();
        } else if (state is AddEditProductDeletedState) {
          AppSnackBar.show(
            context,
            message: S.of(context).productDeleted,
            type: SnackBarType.success,
          );
          context.pop();
        } else if (state is AddEditProductErrorState) {
          AppSnackBar.show(
            context,
            message: state.errMessage,
            type: SnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        final isSaving = state is AddEditProductSavingState;
        final isDeleting = state is AddEditProductDeletingState;
        final isUploading = state is AddEditProductImageUploadingState;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  ProductImagePickerWidget(
                    existingImageUrl: currentImageUrl,
                    isUploading: isUploading,
                    onImageSelected: (file) {
                      setState(() => selectedImage = file);
                      context.read<AddEditProductCubit>().uploadImage(file);
                    },
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    label: S.of(context).productName,
                    hint: S.of(context).productNameHint,
                    prefixIcon: Icons.inventory_2_outlined,
                    controller: nameController,
                    validator: (value) {
                      return fieldRequiredVerification(value, context);
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: S.of(context).category,
                    hint: S.of(context).categoryHint,
                    prefixIcon: Icons.category_outlined,
                    controller: categoryController,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: S.of(context).barcode,
                    hint: S.of(context).barcodeHint,
                    prefixIcon: Icons.qr_code_scanner_outlined,
                    controller: barcodeController,
                    suffixIcon: BarcodeWidget(
                      onTap: () async {
                        final String? scanned = await context.push<String>(
                          AppRoutes.barcodeScanner,
                          extra: 'product',
                        );
                        if (scanned != null) {
                          barcodeController.text = scanned;
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  ProductPricesSection(
                    sellPriceController: sellPriceController,
                    buyPriceController: buyPriceController,
                    onSellChanged: (v) {
                      setState(() => sellPrice = double.tryParse(v) ?? 0);
                    },
                    onBuyChanged: (v) {
                      setState(() => buyPrice = double.tryParse(v) ?? 0);
                    },
                    validator: (value) {
                      return fieldRequiredVerification(value, context);
                    },
                  ),
                  ProductStockSection(
                    quantity: quantity,
                    onIncrement: () => setState(() => quantity++),
                    onDecrement: () => setState(() {
                      if (quantity > 0) quantity--;
                    }),
                    thresholdController: thresholdController,
                    validator: (value) {
                      return fieldRequiredVerification(value, context);
                    },
                  ),
                  const SizedBox(height: 20),
                  if (buyPrice > 0 || sellPrice > 0)
                    ProfitCardWidget(buyPrice: buyPrice, sellPrice: sellPrice),
                  const SizedBox(height: 24),
                  CustomButton(
                    buttonName: S.of(context).saveProduct,
                    color: AppColorsDarkMode.textPrimary,
                    isLoading: isSaving,
                    onPressed: isSaving ? null : onSave,
                  ),
                  // ── Delete Button — Edit only ──────────
                  if (isEditMode) ...[
                    const SizedBox(height: 12),
                    DeleteProductButton(isDeleting: isDeleting, widget: widget),
                  ],
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
