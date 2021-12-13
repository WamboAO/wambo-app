import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/notification/data/models/notification_model.dart';

abstract class IGetNotificationDatasource {
  Future<NotificationModel> getNotification(PageConfigEntity params);
}
