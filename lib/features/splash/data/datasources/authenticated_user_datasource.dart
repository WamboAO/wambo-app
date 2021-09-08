import 'package:wambo/features/splash/data/models/authenticated_user_model.dart';

abstract class IAuthenticatedUserDatasource {
  Future<AuthenticatedUserModel> getAuthenticatedUserLocaly();
}
