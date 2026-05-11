import 'dart:io';

import 'package:stock_mate/features/settings/data/models/settings_user_model.dart';

abstract class SettingsRemoteDataSource {
  Future<SettingsUserModel> getUserData();
  Future<void> updateShopName(String shopName);
  Future<void> updateDisplayName(String displayName);
  Future<String> uploadShopLogo(File image);
  Future<void> updateShopLogoUrl(String url);
  Future<void> logout();
}
