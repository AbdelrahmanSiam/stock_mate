import 'package:stock_mate/features/language/data/local/language_local_data.dart';
import 'package:stock_mate/features/language/domain/repo/language_repo.dart';

class LanguageRepoImpl extends LanguageRepo{
  final LanguageLocalData languageLocalData;

  LanguageRepoImpl({required this.languageLocalData});
  @override
  Future<String?> getSavedLanguage() async {
    return await languageLocalData.getSavedLanguage();
  }

  @override
  Future<void> saveLanguage({required String languageCode}) async{
    await languageLocalData.saveLanguage(languageCode: languageCode);
  }
}