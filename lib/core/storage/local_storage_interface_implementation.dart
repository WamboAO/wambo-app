import 'package:shared_preferences/shared_preferences.dart';
import 'package:wambo/core/interfaces/local_storage_interface.dart';

class SharedLocalStorage implements ILocalStorage {
  @override
  Future clear() async {
    var shared = await SharedPreferences.getInstance();
    return shared.clear();
  }

  @override
  Future get(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  @override
  Future delete(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.remove(key);
  }

  @override
  Future<bool> put(String key, dynamic value) async {
    var shared = await SharedPreferences.getInstance();
    if (value is bool) {
      shared.setBool(key, value);
      return true;
    } else if (value is String) {
      shared.setString(key, value);
      return true;
    } else if (value is int) {
      shared.setInt(key, value);
      return true;
    } else if (value is double) {
      shared.setDouble(key, value);
      return true;
    } else if (value is List<String>) {
      shared.setStringList(key, value);
      return true;
    } else {
      return false;
    }
  }
}
