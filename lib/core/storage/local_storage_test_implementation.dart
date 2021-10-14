import 'dart:convert';

import 'package:wambo/core/storage/fake_storage_data.dart';

import '../interfaces/local_storage_interface.dart';

class SharedLocalStorageTest implements ILocalStorage {
  final _faker = FakeLocalData();
  @override
  Future<bool> clear({String? debugType}) async {
    return true;
  }

  @override
  Future get({required String key, String? debugType}) async {
    var value = jsonEncode(_faker.fakeAuthValues);

    return value;
  }

  @override
  Future<bool> delete({required String key, String? debugType}) async {
    return true;
  }

  @override
  Future<bool> put(
      {required String key, required dynamic value, String? debugType}) async {
    return true;
  }
}
