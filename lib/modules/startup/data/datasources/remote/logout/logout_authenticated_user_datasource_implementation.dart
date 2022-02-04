import 'package:errors/errors.dart';
import 'package:remote/remote.dart';
import 'package:wambo/core/shared/entities/generic_entity.dart';
import 'package:wambo/modules/authentication/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/core/shared/entities/validation_helpers.dart';
import 'package:wambo/modules/startup/data/datasources/remote/logout/logout_authenticated_user_data.dart';
import 'package:wambo/modules/startup/data/datasources/remote/logout/logout_authenticated_user_datasource.dart';

class LogoutAuthenticatedUserDatasourceImplementation
    implements ILogoutAuthenticatedUserDatasource {
  LogoutAuthenticatedUserDatasourceImplementation(this.client);

  final IRemote client;
  final _header = ApiHeaders();
  final _data = LogoutAuthenticatedUserData();

  @override
  Future<GenericModel> logoutUser(AuthenticatedUserEntity params) async {
    try {
      var tokenValidation = validateValue(params.token, "Token");
      var appValidation = validateValue(params.appToken, "appToken");
      if (tokenValidation != null || appValidation != null) {
        throw const FetchDataException("Token is null");
      }
      final json = await client.post(
          query: "",
          header: _header.setTokenHeaders(
              token: params.token!, appToken: params.appToken!),
              debugData: _data.generic);
      return GenericModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
