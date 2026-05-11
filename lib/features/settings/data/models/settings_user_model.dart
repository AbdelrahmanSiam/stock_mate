import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/features/settings/domain/enitites/settings_user_entity.dart';

class SettingsUserModel extends SettingsUserEntity {
  SettingsUserModel({
    required super.id,
    required super.displayName,
    required super.email,
    required super.shopName,
    required super.shopLogoUrl,
    required super.shopId,
  });

  factory SettingsUserModel.fromFireStore(
    Map<String, dynamic> json,
    String id,
  ) {
    return SettingsUserModel(
      id: id,
      displayName: json[kDisplayName] ?? '',
      email: json[kEmail] ?? '',
      shopName: json[kShopName] ?? '',
      shopLogoUrl: json[kShopLogoUrl] ?? '',
      shopId: json[kShopId] ?? 'SHOP-${id.substring(0, 5).toUpperCase()}',
    );
  }
  Map<String, dynamic> toFirestore() => {
    kDisplayName: displayName,
    kEmail: email,
    kShopName: shopName,
    kShopLogoUrl: shopLogoUrl,
    kShopId: shopId,
  };
}
