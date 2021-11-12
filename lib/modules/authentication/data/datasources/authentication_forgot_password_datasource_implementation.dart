import 'package:wambo/core/interfaces/remote_interface.dart';
import 'package:wambo/core/shared/entities/generic_entity.dart';
import 'package:wambo/core/shared/helpers/api_header_helpers.dart';
import 'package:wambo/modules/authentication/data/datasources/authentication_forgot_password_datasource.dart';
import 'package:wambo/modules/authentication/data/models/user_registration_credentials_model.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';

class AuthenticationForgotPasswordDatasourceImplementation
    implements IAuthenticationForgotPasswordDatasource {
  AuthenticationForgotPasswordDatasourceImplementation(this.client);
  final IRemote client;
  final _header = ApiHeaders();

  @override
  Future<GenericModel> resetPassword(
      UserRegistrationCredentialsEntity params) async {
    try {
      UserRegistrationCredentialsModel body = UserRegistrationCredentialsModel(
          email: params.email, registrationType: params.registrationType, appId: params.appId, appToken: params.appToken, type: params.type);
      final response = await client.post(
          query: "",
          header: _header.setAuthHeaders(params.appToken),
          body: body,
          debugType: "authentication_forgot_password");
      return GenericModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
