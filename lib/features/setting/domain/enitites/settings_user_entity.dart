class SettingsUserEntity {
  final String id;
  final String displayName;
  final String email;
  final String shopName;
  final String shopLogoUrl;
  final String shopId;

  const SettingsUserEntity({
    required this.id,
    required this.displayName,
    required this.email,
    required this.shopName,
    required this.shopLogoUrl,
    required this.shopId,
  });

  factory SettingsUserEntity.empty() {
    return SettingsUserEntity(
      id: '',
      displayName: '',
      email: '',
      shopName: '',
      shopLogoUrl: '',
      shopId: '',
    );
  }
  SettingsUserEntity copyWith({
    String? displayName,
    String? shopName,
    String? shopLogoUrl,
  }) {
    return SettingsUserEntity(
      id: id,
      displayName: displayName ?? this.displayName,
      email: email,
      shopName: shopName ?? this.shopName,
      shopLogoUrl: shopLogoUrl ?? this.shopLogoUrl,
      shopId: shopId,
    );
  }
}
