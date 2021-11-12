import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/interfaces/remote_interface.dart';
import 'package:wambo/core/shared/entities/generic_entity.dart';
import 'package:wambo/core/shared/entities/authenticated_user_entity.dart';
import 'package:wambo/core/shared/entities/validation_helpers.dart';
import 'package:wambo/core/shared/helpers/api_header_helpers.dart';
import 'package:wambo/modules/startup/data/datasources/remote/logout_authenticated_user_datasource.dart';

class LogoutAuthenticatedUserDatasourceImplementation
    implements ILogoutAuthenticatedUserDatasource {
  LogoutAuthenticatedUserDatasourceImplementation(this.client);

  final IRemote client;
  final _header = ApiHeaders();

  @override
  Future<GenericModel> logoutUser(AuthenticatedUserEntity params) async {
    try {
      var tokenValidation = validateValue(params.token, "Token");
      var appValidation = validateValue(params.appToken, "appToken");
      if (tokenValidation != null || appValidation !=null) {
        throw FetchDataException("Token is null");
      }
      final json = await client.post(
          query: "", header: _header.setTokenHeaders(token: params.token!, appToken: params.appToken!));
      return GenericModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
