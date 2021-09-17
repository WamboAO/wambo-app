import 'package:wambo/features/startup/data/models/authenticated_user_model.dart';

abstract class IAuthenticatedUserDatasource {
  Future<AuthenticatedUserModel> getAuthenticatedUserLocaly();
}
