import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/authentication/data/models/user_registration_credentials_model.dart';

abstract class IAuthenticationWithSocialDatasource {
  Future<UserRegistrationCredentialsModel> loginWithSocial(Social params);
}
