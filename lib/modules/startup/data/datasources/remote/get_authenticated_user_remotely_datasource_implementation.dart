import 'package:wambo/app/imports.dart';
import 'package:wambo/core/shared/helpers/api_header_helpers.dart';
import 'package:wambo/core/shared/models/authenticated_user_response_model.dart';
import 'package:wambo/core/shared/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/data/models/app_configuration_model.dart';

class GetAuthenticatedUserRemotelyDatasourceImplementation
    implements IGetAuthenticatedUserRemotelyDatasource {
  GetAuthenticatedUserRemotelyDatasourceImplementation(this.client);
  final IRemote client;
  final _header = ApiHeaders();

  @override
  Future<AuthenticatedUserResponseModel> getUserRemotely(
      AuthenticatedUserEntity params) async {
    try {
      final json = await client.get(
          query: "", header: _header.setHeaders(), debugType: "get_auth_user");
      return AuthenticatedUserResponseModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
   @override
  Future<AppConfigurationModel> getAppConfig(String params) async {
    try {
      final json = await client.get(
          query: "",
          header: _header.setHeaders(),
          debugType: "get_app_config");
      return AppConfigurationModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  
  }

  
}
