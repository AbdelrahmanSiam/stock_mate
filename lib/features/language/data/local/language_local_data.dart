abstract class LanguageLocalData {
  Future<String?> getSavedLanguage();
  Future<void> saveLanguage({required String languageCode});
}
