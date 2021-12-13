import 'package:dartz/dartz.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/notification/domain/entities/notification_entity.dart';

abstract class IGetNotificationRepository {
  Future<Either<Failure, NotificationEntity>> getNotification(
      PageConfigEntity params);
}
