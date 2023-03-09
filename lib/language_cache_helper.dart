import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  Future<void> cacheLanguageCode(String languageCode) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString('LOCALE', languageCode);
  }

  Future<String> getCachedLanguageCode() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? languageCode = sharedPreferences.getString('LOCALE');
    if (languageCode != null) {
      return languageCode;
    } else {
      return 'en';
    }
  }
}
