import 'package:shared_preferences/shared_preferences.dart';
import 'package:wambo/core/interfaces/local_storage_interface.dart';

class SharedLocalStorage implements ILocalStorage {
  @override
  Future<bool> clear() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    bool response = await shared.clear();
    return response;
  }

  @override
  Future get(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  @override
  Future<bool> delete(String key) async {
    var shared = await SharedPreferences.getInstance();
    bool response = await shared.remove(key);
    return response;
  }

  @override
  Future<bool> put(String key, dynamic value) async {
    var shared = await SharedPreferences.getInstance();
    bool response = false;
    if (value is bool) {
      response = await shared.setBool(key, value);
      return response;
    } else if (value is String) {
      response = await shared.setString(key, value);
      return response;
    } else if (value is int) {
      response = await shared.setInt(key, value);
      return response;
    } else if (value is double) {
      response = await shared.setDouble(key, value);
      return response;
    } else if (value is List<String>) {
      response = await shared.setStringList(key, value);
      return response;
    } else {
      return response;
    }
  }
}
