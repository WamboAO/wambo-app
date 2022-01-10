import 'package:wambo/core/shared/models/authenticated_user_model.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';

abstract class IAuthenticationDatasource {
  Future<AuthenticatedUserModel> login(
      UserRegistrationCredentialsEntity params);
  Future<AuthenticatedUserModel> register(
      UserRegistrationCredentialsEntity params);
      Future<AuthenticatedUserModel> edit(
      UserRegistrationCredentialsEntity params);
  Future<AuthenticatedUserModel> social(
      UserRegistrationCredentialsEntity params);
  Future<AuthenticatedUserModel> passwordReset(
      UserRegistrationCredentialsEntity params);
}
