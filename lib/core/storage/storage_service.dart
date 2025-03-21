import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<bool> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool> removeString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }
}
