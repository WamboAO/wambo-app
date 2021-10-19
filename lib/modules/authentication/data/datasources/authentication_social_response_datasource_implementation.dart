import 'package:wambo/core/interfaces/remote_interface.dart';
import 'package:wambo/core/shared/helpers/api_header_helpers.dart';
import 'package:wambo/modules/authentication/data/datasources/authentication_social_response_datasource.dart';
import 'package:wambo/modules/authentication/data/models/user_registration_credentials_model.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/data/models/authentication_user_response_model.dart';

class AuthenticationSocialResponseDatasourceImplementation
    implements IAuthenticationSocialResponseDatasource {
  AuthenticationSocialResponseDatasourceImplementation(this.client);
  final IRemote client;
  final _header = ApiHeaders();
  @override
  Future<AuthenticationUserResponseModel> access(
      UserRegistrationCredentialsEntity params) async {
    try {
      UserRegistrationCredentialsModel body = UserRegistrationCredentialsModel(
          firstName: params.firstName!.trim(),
          lastName: params.lastName,
          email: params.email!.trim(),
          avatar: params.avatar,
          registrationType: params.registrationType);
      final response = await client.post(
          query: "",
          header: _header.setAuthHeaders(params.appToken!),
          body: body,
          debugType: "authentication_register");
      return AuthenticationUserResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
