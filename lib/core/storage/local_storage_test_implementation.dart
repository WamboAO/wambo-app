import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/local_storage_interface.dart';

class SharedLocalStorageTest implements ILocalStorage {
  @override
  Future clear() async {
    var shared = await SharedPreferences.getInstance();
    return shared.clear();
  }

  @override
  Future get(String key) async {
    Map<String, Object> values = {
      "token": "dfgdlfkgh;sdlkg;dflgkj",
      "refresh_token": "dldfkgjdfglkh",
      "user_id": 1,
      "is_first_time": false
    };
    var value = jsonEncode(values);

    return value;
  }

  @override
  Future delete(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.remove(key);
  }

  @override
  Future put(String key, dynamic value) async {
    var shared = await SharedPreferences.getInstance();
    if (value is bool) {
      shared.setBool(key, value);
    } else if (value is String) {
      shared.setString(key, value);
    } else if (value is int) {
      shared.setInt(key, value);
    } else if (value is double) {
      shared.setDouble(key, value);
    } else if (value is List<String>) {
      shared.setStringList(key, value);
    }
  }
}
