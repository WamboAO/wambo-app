import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/modules/notification/data/datasources/get_notification_datasource.dart';
import 'package:wambo/modules/notification/domain/entities/notification_entity.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/modules/notification/domain/repositories/get_notification_repository.dart';

class GetNotificationRepositoryImplementation
    implements IGetNotificationRepository {
  GetNotificationRepositoryImplementation(this.datasource);

  final IGetNotificationDatasource datasource;
  @override
  Future<Either<Failure, NotificationEntity>> getNotification(
      PageConfigEntity params) async{
    try {
      final result = await datasource.getNotification(params);
      return Right(result);
    } on FetchDataException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on BadRequestException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on UnauthorisedException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on NotFoundException catch (e) {
      return Left(FetchDataFailure("$e"));
    }
  }
}
