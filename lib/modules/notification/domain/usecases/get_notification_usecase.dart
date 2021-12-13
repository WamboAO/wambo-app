import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/notification/domain/entities/notification_entity.dart';
import 'package:wambo/modules/notification/domain/repositories/get_notification_repository.dart';

class GetNotificationUsecase
    implements Usecase<NotificationEntity, PageConfigEntity> {
  GetNotificationUsecase(this.repository);

  final IGetNotificationRepository repository;
  @override
  Future<Either<Failure, NotificationEntity>> call(
      PageConfigEntity params) async {
    return await repository.getNotification(params);
  }
}
