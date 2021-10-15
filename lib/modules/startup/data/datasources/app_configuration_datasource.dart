import 'package:wambo/modules/startup/data/models/app_configuration_model.dart';

abstract class IAppConfigurationDatasource {
  Future<AppConfigurationModel> getAppConfig();
}
