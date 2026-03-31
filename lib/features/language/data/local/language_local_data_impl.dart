import 'package:hive/hive.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/features/language/data/local/language_local_data.dart';

class LanguageLocalDataImpl implements LanguageLocalData {
  final Box box;
  LanguageLocalDataImpl({required this.box});

  @override
  Future<String?> getSavedLanguage()async {
    return box.get(kLanguageKey) as String?;
  }

  @override
  Future<void> saveLanguage({required String languageCode}) async{
    await box.put(kLanguageKey, languageCode);
  }
}