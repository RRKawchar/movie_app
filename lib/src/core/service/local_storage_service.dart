import 'package:movie_app_demo/src/core/enums/app_enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService{

 static Future<void> saveSession({required LocalStorageKey key, required dynamic data}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key.toString(), data);
  }

  static Future<String?> getSavedSession({required LocalStorageKey key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key.toString());
  }

 static Future<void> clearSession({required LocalStorageKey key}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key.toString());
  }


}