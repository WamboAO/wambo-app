import 'package:http/http.dart';
import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/interfaces/remote_interface.dart';

import 'fake_remote_data.dart';

class RemoteFkImplementation implements IRemote {
  final _fake = FakeRemoteData();
  @override
  Future delete(
      {required String query,
      required Map<String, String> header,
      body,
      String? debugType}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(
      {required String query,
      required Map<String, String> header,
      String? debugType}) async {
    late Map<String, Object?> value;
    await Future.delayed(const Duration(seconds: 3));
    if (debugType == "get_auth_user") {
      value = _fake.fakeAuthValues;
    }
    if (debugType == "get_app_config") {
      value = _fake.fakeappConfig;
    }
    if (debugType == "get_store_info") {
      value = _fake.fakeStoreInfo;
    }
    if (debugType == "get_categories") {
      value = _fake.fakeCategories;
    }
    if (debugType == "get_notifications") {
      value = _fake.fakeNotification;
    }
    return value;
  }

  @override
  Future patch(
      {required String query,
      required Map<String, String> header,
      body,
      String? debugType}) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future post(
      {required String query,
      required Map<String, String> header,
      body,
      String? debugType}) async {
    late Map<String, Object?> value;
    await Future.delayed(const Duration(seconds: 3));
    if (debugType == "get_auth_user" || debugType == "login_user") {
      value = _fake.fakeAuthValues;
    }
    return value;
  }

  @override
  Future put(
      {required String query,
      required Map<String, String> header,
      body,
      String? debugType}) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> returnResponse(Response response) {
    // TODO: implement returnResponse
    throw UnimplementedError();
  }
}
