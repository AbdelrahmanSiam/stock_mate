import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/core/utils/widgets/custom_text_field.dart';
import 'package:stock_mate/core/utils/widgets/custom_user_avatar.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/account_card.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/danger_zone.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/preferences_card.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/setting_view_header.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/shop_info_card.dart';
import 'package:stock_mate/generated/l10n.dart';

class SettingViewBody extends StatefulWidget {
  const SettingViewBody({super.key});

  @override
  State<SettingViewBody> createState() => _SettingViewBodyState();
}

class _SettingViewBodyState extends State<SettingViewBody> {
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller.text = "Abdoz Shop";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingViewHeader(),
            const SizedBox(height: 20),
            ShopInfoCard(controller: controller),
            const SizedBox(height: 20),
            AccountCard(),
            const SizedBox(height: 20),
            PreferencesCard(),
            const SizedBox(height: 20),
            DangerZone(),
          ],
        ),
      ),
    );
  }
}
