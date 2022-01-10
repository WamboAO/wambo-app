import 'package:wambo/core/interfaces/remote_interface.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/shared/helpers/api_header_helpers.dart';
import 'package:wambo/modules/notification/data/datasources/get_notification_datasource.dart';
import 'package:wambo/modules/notification/data/models/notification_model.dart';

class GetNotificationDatasourceImplementation
    implements IGetNotificationDatasource {
  GetNotificationDatasourceImplementation(this.client);

  final IRemote client;
  final _header = ApiHeaders();
  @override
  Future<NotificationModel> getNotification(PageConfigEntity params) async {
    try {
      final json = await client.get(
        query: "",
        header: _header.setTokenHeaders(token: params.token!, appToken: params.appToken),
        debugType: "get_notifications",
      );
      return NotificationModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
