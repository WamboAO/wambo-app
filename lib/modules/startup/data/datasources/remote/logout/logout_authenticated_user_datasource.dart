import 'package:wambo/modules/authentication/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/core/shared/entities/generic_entity.dart';

abstract class ILogoutAuthenticatedUserDatasource {
  Future<GenericModel> logoutUser(AuthenticatedUserEntity params);
}