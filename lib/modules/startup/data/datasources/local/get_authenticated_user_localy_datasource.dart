
import 'package:wambo/modules/authentication/data/models/authenticated_user_model.dart';
import 'package:wambo/modules/authentication/domain/entities/authenticated_user_entity.dart';

abstract class IGetAuthenticatedUserLocalyDatasource {
  Future<AuthenticatedUserModel> getUserLocaly();
  Future<bool> addUserLocaly(AuthenticatedUserEntity params);
  Future<bool> removeUser();
}
