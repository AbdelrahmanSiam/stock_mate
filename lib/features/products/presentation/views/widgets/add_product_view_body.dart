import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_snack_bar.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/core/utils/widgets/custom_text_field.dart';
import 'package:stock_mate/features/auth/presentation/views/helper/auth_helper.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/products/presentation/manager/cubits/add_edit_product_cubit/add_edit_product_cubit.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_image_picker_widget.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/profit_card_widget.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/quantity_stepper_widget.dart';
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
      buyPrice: double.tryParse(barcodeController.text) ?? 0,
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
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: S.of(context).sellPrice,
                          hint: '0.00',
                          prefixIcon: Icons.attach_money_outlined,
                          controller: sellPriceController,
                          keyboardType: TextInputType.number,
                          suffixText: S.of(context).egp,
                          validator: (value) {
                            return fieldRequiredVerification(value, context);
                          },
                          onChanged: (v) => setState(
                            () => sellPrice = double.tryParse(v) ?? 0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextField(
                          label: S.of(context).buyPrice,
                          hint: '0.00',
                          prefixIcon: Icons.attach_money_outlined,
                          controller: buyPriceController,
                          keyboardType: TextInputType.number,
                          suffixText: S.of(context).egp,
                          validator: (value) {
                            return fieldRequiredVerification(value, context);
                          },
                          onChanged: (v) => setState(
                            () => buyPrice = double.tryParse(v) ?? 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).initialQuantity,
                              style: AppStyles.labelSemiBold13(context)
                                  .copyWith(
                                    color: AppColorsDarkMode.textSecondary,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            QuantityStepperWidget(
                              value: quantity,
                              onIncrement: () => setState(() => quantity++),
                              onDecrement: () => setState(() => quantity--),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomTextField(
                          label: S.of(context).lowStockAlert,
                          hint: '5',
                          prefixIcon: Icons.notifications_outlined,
                          controller: thresholdController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            return fieldRequiredVerification(value, context);
                          },
                        ),
                      ),
                    ],
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
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: isDeleting
                            ? null
                            : () => _showDeleteDialog(context),
                        child: Text(
                          S.of(context).deleteProduct,
                          style: AppStyles.bodyMediumRegular14(
                            context,
                          ).copyWith(color: AppColorsDarkMode.error),
                        ),
                      ),
                    ),
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

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColorsDarkMode.surface,
        title: Text(
          S.of(context).deleteProduct,
          style: AppStyles.sectionTitleSemiBold16(context),
        ),
        content: Text(
          S.of(context).deleteProductConfirm,
          style: AppStyles.bodyMediumRegular14(context),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<AddEditProductCubit>().deleteProduct(
                id: widget.product!.id,
                imageUrl: widget.product!.imageUrl,
              );
            },
            child: Text(
              S.of(context).delete,
              style: TextStyle(color: AppColorsDarkMode.error),
            ),
          ),
        ],
      ),
    );
  }
}
