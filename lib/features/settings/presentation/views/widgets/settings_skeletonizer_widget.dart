import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stock_mate/features/settings/domain/enitites/settings_user_entity.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/account_card.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/danger_zone.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/preferences_card.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/setting_view_header.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/shop_info_card.dart';

class SettingsSkeletonizerWidget extends StatelessWidget {
  const SettingsSkeletonizerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: const ShimmerEffect(
        highlightColor: Colors.grey,
        baseColor: Colors.black12,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingViewHeader(),
              const SizedBox(height: 20),
              ShopInfoCard(
                user: SettingsUserEntity.empty(),
                isSaving: false,
                isUploadingLogo: false,
              ),
              const SizedBox(height: 20),
              AccountCard(user: SettingsUserEntity.empty()),
              const SizedBox(height: 20),
              PreferencesCard(),
              const SizedBox(height: 20),
              DangerZone(),
            ],
          ),
        ),
      ),
    );
  }
}
