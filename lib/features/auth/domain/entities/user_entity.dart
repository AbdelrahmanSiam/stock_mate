class UserEntity {
  final String id;
  final String email;
  final String displayName;
  final String shopName;
  // final String shopLogoUrl;
  final bool isEmailVerified;

  const UserEntity({
    required this.id,
    required this.email,
    required this.displayName,
    required this.shopName,
    // required this.shopLogoUrl,
    required this.isEmailVerified,
  });
}