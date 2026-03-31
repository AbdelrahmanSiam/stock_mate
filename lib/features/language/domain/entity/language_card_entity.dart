class LanguageCardEntity {
  final String languageName;
  final String languageTagline;
  final bool ? isSelected;
  final String code;
  final void Function()? onTap;

  const LanguageCardEntity({
    required this.languageName,
    required this.languageTagline,
    required this.code,
    this.onTap,
   this.isSelected,
  });
}
