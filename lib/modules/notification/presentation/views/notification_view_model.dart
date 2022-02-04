import 'package:wambo/app/locator.dart';
import 'package:interfaces/interfaces.dart';

import 'package:wambo/modules/notification/domain/entities/notification_entity.dart';
import 'package:wambo/modules/notification/presentation/services/get_notificaion_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/setup.logger.dart';

class NotificationViewModel
    extends StreamViewModel<ApiResponse<NotificationEntity>> {
  NotificationViewModel() {
    log.d('created');
  }

  final log = getLogger('NotificationViewModel');
  final _getNotificationService = locator<GetNotificationService>();
  bool get isError => dataReady && data!.status == Status.error;
  bool get isLoading => dataReady && data!.status == Status.loading;
  bool get isComplete => dataReady && data!.status == Status.completed;
  NotificationEntity? get notify =>
      dataReady && data!.status == Status.completed ? data!.data! : null;
  @override
  Stream<ApiResponse<NotificationEntity>> get stream =>
      _getNotificationService.dataStream;
}
