import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';

abstract class IAuthenticateUserDatasource {
  Future<bool> addAuthenticatedUserLocaly(AuthenticatedUserEntity userAuth);
}
