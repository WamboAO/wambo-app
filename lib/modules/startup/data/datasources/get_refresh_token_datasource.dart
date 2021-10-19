import 'package:wambo/modules/authentication/data/models/authentication_user_response_model.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';

abstract class IGetRefreshTokenDatasource {
  Future<AuthenticationUserResponseModel> refreshToken(AuthenticatedUserEntity params);
}
