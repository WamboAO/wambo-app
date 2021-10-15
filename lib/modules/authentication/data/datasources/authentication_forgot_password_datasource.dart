import 'package:wambo/core/shared/entities/generic_entity.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';

abstract class IAuthenticationForgotPasswordDatasource {
  Future<GenericModel> resetPassword(UserRegistrationCredentialsEntity params);
}