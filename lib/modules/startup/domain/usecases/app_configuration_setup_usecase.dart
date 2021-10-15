import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/modules/startup/domain/entities/app_configuration_entity.dart';
import 'package:wambo/modules/startup/domain/repositories/app_configuration_setup_repository.dart';

class AppConfigurationSetupUsecase
    implements Usecase<AppConfigurationEntity, NoParams> {
  AppConfigurationSetupUsecase(this.repository);
  final IAppConfigurationSetupRepository repository;

  @override
  Future<Either<Failure, AppConfigurationEntity>> call(NoParams params) async {
    return await repository.getAppConfig();
  }
}
