import 'dart:convert';
import 'package:wambo/core/local/fake_storage_data.dart';
import '../interfaces/local_storage_interface.dart';

class LocalStorageFkImplementation implements ILocalStorage {
  final _faker = FakeLocalData();
  @override
  Future<bool> clear({String? debugType}) async {
    return true;
  }

  @override
  Future get({required String key, String? debugType}) async {
    if (debugType == "get_auth_user") {
      var value = jsonEncode(_faker.fakeAuthValues);
      return value;
    }
    if (debugType == "search_list") {
      var value = jsonEncode(_faker.fakeSearchList);
      return value;
    }
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
