import 'package:wambo/features/startup/data/models/generic_model.dart';
import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';

abstract class IAuthenticateUserDatasource {
  Future<GenericModel> addAuthenticatedUserLocaly(AuthenticatedUserEntity userAuth);
}
