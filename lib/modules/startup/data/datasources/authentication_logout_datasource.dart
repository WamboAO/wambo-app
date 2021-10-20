import 'package:wambo/core/shared/entities/generic_entity.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';

abstract class IAuthenticationLogoutDatasource {
  Future<GenericModel> logout(AuthenticatedUserEntity params);
}
