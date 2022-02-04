import 'package:wambo/app/imports.dart';
import 'package:wambo/modules/authentication/data/models/user_registration_credentials_model.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/data/models/authenticated_user_model.dart';

class AuthenticationDatasourceImplementation
    implements IAuthenticationDatasource {
  AuthenticationDatasourceImplementation(this.client);

  final IRemote client;
  final _header = ApiHeaders();

  @override
  Future<AuthenticatedUserModel> login(
      UserRegistrationCredentialsEntity params) async {
    try {
      UserRegistrationCredentialsModel body = UserRegistrationCredentialsModel(
          email: params.email,
          password: params.password,
          appId: params.appId,
          appToken: params.appToken,
          registrationType: params.registrationType,
          type: params.type);
      final json = await client.post(
          query: "",
          header: _header.setAuthHeaders(params.appToken),
          body: body);
      return AuthenticatedUserModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthenticatedUserModel> register(
      UserRegistrationCredentialsEntity params) async {
    try {
       UserRegistrationCredentialsModel body = UserRegistrationCredentialsModel(
          email: params.email,
          name: params.name,
          phone: params.phone,
          password: params.password,
          appId: params.appId,
          appToken: params.appToken,
          registrationType: params.registrationType,
          type: params.type);
      final json = await client.post(
          query: "",
          header: _header.setAuthHeaders(params.appToken),
          body: body);
      return AuthenticatedUserModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthenticatedUserModel> social(
      UserRegistrationCredentialsEntity params) async {
    try {
        UserRegistrationCredentialsModel body = UserRegistrationCredentialsModel(
          email: params.email,
          name: params.name,
          avatar: params.avatar,
          dob: params.dob,
          appId: params.appId,
          appToken: params.appToken,
          registrationType: params.registrationType,
          type: params.type);
      final json = await client.post(
          query: "",
          header: _header.setAuthHeaders(params.appToken),
          body: body);
      return AuthenticatedUserModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthenticatedUserModel> edit(UserRegistrationCredentialsEntity params) async{
    try {
        UserRegistrationCredentialsModel body = UserRegistrationCredentialsModel(
          email: params.email,
          name: params.name,
          avatar: params.avatar,
          phone: params.phone,
          gender: params.gender,
          address: params.address,
          dob: params.dob,
          appId: params.appId,
          appToken: params.appToken,
          registrationType: params.registrationType,
          type: params.type);
      final json = await client.post(
          query: "",
          header: _header.setAuthHeaders(params.appToken),
          body: body);
      return AuthenticatedUserModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthenticatedUserModel> passwordReset(UserRegistrationCredentialsEntity params) async{
    try {
        UserRegistrationCredentialsModel body = UserRegistrationCredentialsModel(
          password: params.password,
          appId: params.appId,
          appToken: params.appToken,
          registrationType: params.registrationType,
          type: params.type);
      final json = await client.post(
          query: "",
          header: _header.setAuthHeaders(params.appToken),
          body: body);
      return AuthenticatedUserModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
