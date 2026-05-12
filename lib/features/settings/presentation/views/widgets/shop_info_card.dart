import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/core/utils/widgets/custom_text_field.dart';
import 'package:stock_mate/features/settings/domain/enitites/settings_user_entity.dart';
import 'package:stock_mate/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/shop_id_badge.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/shop_logo.dart';
import 'package:stock_mate/generated/l10n.dart';

class ShopInfoCard extends StatefulWidget {
  const ShopInfoCard({
    super.key,
    required this.user,
    required this.isSaving,
    required this.isUploadingLogo,
  });

  final SettingsUserEntity user;
  final bool isSaving;
  final bool isUploadingLogo;

  @override
  State<ShopInfoCard> createState() => _ShopInfoCardState();
}

class _ShopInfoCardState extends State<ShopInfoCard> {
  late final TextEditingController _shopNameController;
  @override
  void initState() {
    _shopNameController = TextEditingController(text: widget.user.shopName);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ShopInfoCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If shopName changes in the state, update the text field
    if (oldWidget.user.shopName != widget.user.shopName) {
      _shopNameController.text = widget.user.shopName;
    }
  }

  @override
  void dispose() {
    _shopNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).shopInfo,
          style: AppStyles.labelSemiBold13(
            context,
          ).copyWith(color: AppColorsDarkMode.textSecondary),
        ),
        SizedBox(height: 10),
        AppCard(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          child: Column(
            children: [
              ShopLogo(
                user: widget.user,
                isUploadingLogo: widget.isUploadingLogo,
              ),
              const SizedBox(height: 30),
              Text(
                widget.user.shopName.isEmpty
                    ? S.of(context).yourShop
                    : widget.user.shopName,
                style: AppStyles.appNameBold32(context),
              ),
              const SizedBox(height: 3),
              ShopIdBadge(shopId: widget.user.shopId),
              const SizedBox(height: 20),
              CustomTextField(
                label: S.of(context).shopName,
                hint: "",
                prefixIcon: Icons.store,
                controller: _shopNameController,
              ),
              const SizedBox(height: 10),
              CustomButton(
                onPressed: widget.isSaving
                    ? null
                    : () => context.read<SettingsCubit>().updateShopName(
                        _shopNameController.text.trim(),
                      ),

                isLoading: widget.isSaving,
                buttonName: S.of(context).saveChanges,
                iconButton: Icons.save,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
