import 'package:wambo/app/imports.dart';
import 'package:wambo/modules/authentication/data/models/authenticated_user_response_model.dart';
import 'package:wambo/modules/authentication/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/data/datasources/remote/user/authenticated_user_remote_data.dart';
import 'package:wambo/modules/startup/data/models/app_configuration_model.dart';

class GetAuthenticatedUserRemotelyDatasourceImplementation
    implements IGetAuthenticatedUserRemotelyDatasource {
  GetAuthenticatedUserRemotelyDatasourceImplementation(this.client);
  final IRemote client;
  final _header = ApiHeaders();
  final _data = AuthenticatedUserRemoteData();
  @override
  Future<AuthenticatedUserResponseModel> getUserRemotely(
      AuthenticatedUserEntity params) async {
    try {
      final json = await client.get(
          query: "", header: _header.setHeaders(), debugData: _data.fakeAuthValues);
      return AuthenticatedUserResponseModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AppConfigurationModel> getAppConfig(String params) async {
    try {
      final json = await client.get(
          query: "", header: _header.setHeaders(), debugData: _data.fakeappConfig);
      return AppConfigurationModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
