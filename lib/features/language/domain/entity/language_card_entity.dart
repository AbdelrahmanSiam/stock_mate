class LanguageCardEntity {
  final String languageName;
  final String languageTagline;
  final bool isSelected;
  final void Function()? onTap;

  const LanguageCardEntity({
    required this.languageName,
    required this.languageTagline,
    required this.isSelected,
    required this.onTap,
  });
}
