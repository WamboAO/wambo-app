import 'package:wambo/core/interfaces/remote_interface.dart';
import 'package:wambo/core/shared/helpers/api_header_helpers.dart';
import 'package:wambo/modules/startup/data/datasources/app_configuration_datasource.dart';
import 'package:wambo/modules/startup/data/models/app_configuration_model.dart';

class AppConfigurationDatasourceImplementation
    implements IAppConfigurationDatasource {
  AppConfigurationDatasourceImplementation(this.client);
  final IRemote client;
  final _header = ApiHeaders();
  @override
  Future<AppConfigurationModel> getAppConfig() async {
    try {
      final response = await client.get(
          query: "query",
          header: _header.setHeaders(),
          debugType: "get_app_config");
      return AppConfigurationModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
