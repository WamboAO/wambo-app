import 'package:wambo/core/interfaces/remote_interface.dart';
import 'package:wambo/core/remote/fake_remote_data.dart';

class RemoteTestImplementation extends IRemote {
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
    await Future.delayed(const Duration(milliseconds: 300));
    if (debugType == 'get_app_config') value = _fake.fakeAppConfigValues;
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
      String? debugType}) {
    // TODO: implement post
    throw UnimplementedError();
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
}
