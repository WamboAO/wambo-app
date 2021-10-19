import 'package:wambo/core/interfaces/remote_interface.dart';
import 'package:wambo/core/shared/helpers/api_header_helpers.dart';
import 'package:wambo/modules/authentication/data/datasources/authentication_login_datasource.dart';
import 'package:wambo/modules/authentication/data/models/user_registration_credentials_model.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/data/models/authentication_user_response_model.dart';

class AuthenticationLoginDatasourceImplementation implements IAuthenticationLoginDatasource {
  AuthenticationLoginDatasourceImplementation(this.client);
  final IRemote client;
  final _header = ApiHeaders();

  
  @override
  Future<AuthenticationUserResponseModel> login(UserRegistrationCredentialsEntity params) async{
     try {
      UserRegistrationCredentialsModel body = UserRegistrationCredentialsModel(
        email: params.email!.trim(),
        password: params.password!.trim(),
        registrationType: params.registrationType,
        
        );
      final response = await client.post(query: "", header: _header.setAuthHeaders(params.appToken!), body: body, debugType: "authentication_login");
      return AuthenticationUserResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  
  
}