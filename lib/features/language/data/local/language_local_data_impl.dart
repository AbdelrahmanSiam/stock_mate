import 'package:hive/hive.dart';
import 'package:stock_mate/features/language/data/local/language_local_data.dart';

const String kLanguageBox = 'language_box';
const String kLanguageKey = 'selected_language';

class LanguageLocalDataImpl implements LanguageLocalData {
  final Box box;
  LanguageLocalDataImpl({required this.box});

  @override
  Future<String> getSavedLanguage()async {
    return box.get(kLanguageKey);
  }

  @override
  Future<void> saveLanguage({required String languageCode}) async{
   return await box.put(kLanguageKey, languageCode);
  }
}
