abstract class LanguageRepo {
  Future<void> saveLanguage({required String languageCode});
  Future<String?> getSavedLanguage();
}
