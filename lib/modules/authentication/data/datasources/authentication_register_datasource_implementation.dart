import 'package:wambo/core/interfaces/remote_interface.dart';
import 'package:wambo/core/shared/helpers/api_header_helpers.dart';
import 'package:wambo/modules/authentication/data/datasources/authentication_register_datasource.dart';
import 'package:wambo/modules/authentication/data/models/user_registration_credentials_model.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/data/models/authentication_user_response_model.dart';

class AuthenticationRegisterDatasourceImplementation implements IAuthenticationRegisterDatasource {
  AuthenticationRegisterDatasourceImplementation(this.client);
  final IRemote client;
  final _header = ApiHeaders();

  
  @override
  Future<AuthenticationUserResponseModel> signup(UserRegistrationCredentialsEntity params) async {
    try {
      UserRegistrationCredentialsModel body = UserRegistrationCredentialsModel(
        firstName: params.firstName,
        lastName: params.lastName,
        phone: params.phone,
        email: params.email,
        password: params.password,
        registrationType: params.registrationType
        );
      final response = await client.post(query: "", header: _header.setHeaders(), body: body, debugType: "authentication_register");
      return AuthenticationUserResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
}

 