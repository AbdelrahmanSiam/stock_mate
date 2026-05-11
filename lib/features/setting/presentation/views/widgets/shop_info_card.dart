import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/core/utils/widgets/custom_text_field.dart';
import 'package:stock_mate/core/utils/widgets/custom_user_avatar.dart';
import 'package:stock_mate/generated/l10n.dart';

class ShopInfoCard extends StatelessWidget {
  const ShopInfoCard({super.key, required this.controller});

  final TextEditingController controller;

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
              SizedBox(child: CustomUserAvatar()),
              const SizedBox(height: 30),
              Text("Abdoz Shop", style: AppStyles.appNameBold32(context)),
              const SizedBox(height: 3),
              Text(
                "ID : SHOP-8255",
                style: AppStyles.buttonSemiBold15(
                  context,
                ).copyWith(color: AppColorsDarkMode.textSecondary),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: S.of(context).shopName,
                hint: "",
                prefixIcon: Icons.store,
                controller: controller,
              ),
              const SizedBox(height: 10),
              CustomButton(
                onPressed: () {},
                isLoading: false,
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
