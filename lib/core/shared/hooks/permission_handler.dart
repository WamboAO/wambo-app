import 'package:permission_handler/permission_handler.dart';
import 'package:wambo/core/errors/exception.dart';

class PermissionHandler {
  Future requestPermission() async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.notification].request();

    return statuses;
  }

  Future<bool> phoneSettings() async {
    try {
      var result = await openAppSettings();
      return result;
    } catch (e) {
      throw FetchDataException('erro');
    }
  }
}
