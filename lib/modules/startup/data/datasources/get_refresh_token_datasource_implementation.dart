import 'package:wambo/core/interfaces/remote_interface.dart';
import 'package:wambo/core/shared/helpers/api_header_helpers.dart';
import 'package:wambo/modules/authentication/data/models/authentication_user_response_model.dart';
import 'package:wambo/modules/startup/data/datasources/get_refresh_token_datasource.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/data/models/authenticated_user_model.dart';

class GetRefreshTokenDatasourceImplementation
    implements IGetRefreshTokenDatasource {
  GetRefreshTokenDatasourceImplementation(this.client);
  final IRemote client;
  final _header = ApiHeaders();
  @override
  Future<AuthenticationUserResponseModel> refreshToken(
      AuthenticatedUserEntity params) async {
    try {
      Map<String, String> queryParams = {
        'token': params.token,
        'refresh_token': params.refreshToken,
      };

      String queryString = Uri(queryParameters: queryParams).query;
      final response = await client.get(
          query: "?$queryString",
          debugType: "refresh_token",
          header: _header.setAuthHeaders(params.appToken));
      return AuthenticationUserResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
