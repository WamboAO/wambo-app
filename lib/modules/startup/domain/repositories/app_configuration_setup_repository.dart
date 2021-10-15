import 'package:dartz/dartz.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/modules/startup/domain/entities/app_configuration_entity.dart';

abstract class IAppConfigurationSetupRepository {
  Future<Either<Failure, AppConfigurationEntity>> getAppConfig();
}
