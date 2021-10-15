import 'package:wambo/core/mixins/repository_data_mixin.dart';
import 'package:wambo/modules/startup/data/datasources/app_configuration_datasource.dart';
import 'package:wambo/modules/startup/data/models/app_configuration_model.dart';
import 'package:wambo/modules/startup/domain/entities/app_configuration_entity.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/modules/startup/domain/repositories/app_configuration_setup_repository.dart';

class AppConfigurationSetupRepositoryImplementation
    with RepositoryDataHelper<AppConfigurationModel>
    implements IAppConfigurationSetupRepository {
  AppConfigurationSetupRepositoryImplementation(this.datasource);
  final IAppConfigurationDatasource datasource;
  
  @override
  Future<Either<Failure, AppConfigurationEntity>> getAppConfig() async {
    return await requestFromRepository(datasource.getAppConfig());
  }
}
