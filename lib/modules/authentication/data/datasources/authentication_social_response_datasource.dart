import 'package:wambo/modules/authentication/data/models/authentication_user_response_model.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';

abstract class IAuthenticationSocialResponseDatasource {
  Future<AuthenticationUserResponseModel> access(
      UserRegistrationCredentialsEntity params);
}
