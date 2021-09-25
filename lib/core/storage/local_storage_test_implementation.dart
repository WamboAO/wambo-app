import 'dart:convert';

import 'package:faker/faker.dart';

import '../interfaces/local_storage_interface.dart';

class SharedLocalStorageTest implements ILocalStorage {
  final _faker = Faker();

  @override
  Future<bool> clear() async {
    return true;
  }

  @override
  Future get(String key) async {
    Map<String, Object> values = {
      "token": _faker.jwt.expired(),
      "refresh_token": _faker.guid.guid(),
      "user_id": 1,
      "username": _faker.internet.userName(),
      "avatar": _faker.image.image(),
      "is_first_time": true
    };
    var value = jsonEncode(values);

    return value;
  }

  @override
  Future<bool> delete(String key) async {
    return true;
  }

  @override
  Future<bool> put(String key, dynamic value) async {
    return true;
  }
}
