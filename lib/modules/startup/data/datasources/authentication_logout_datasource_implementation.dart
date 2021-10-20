import 'package:wambo/core/interfaces/remote_interface.dart';
import 'package:wambo/core/shared/entities/generic_entity.dart';
import 'package:wambo/core/shared/helpers/api_header_helpers.dart';
import 'package:wambo/modules/startup/data/datasources/authentication_logout_datasource.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';

class AuthenticationLogoutDatasourceImplementation
    implements IAuthenticationLogoutDatasource {
  AuthenticationLogoutDatasourceImplementation(this.client);
  final IRemote client;
  final _header = ApiHeaders();
  @override
  Future<GenericModel> logout(AuthenticatedUserEntity params) async {
    try {
      final response = await client.get(
          query: "",
          header: _header.setTokenHeaders(
              token: params.token, appToken: params.appToken),
          debugType: "authentication_logout");
      return GenericModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
