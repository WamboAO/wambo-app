import 'package:wambo/modules/authentication/data/models/authenticated_user_response_model.dart';
import 'package:wambo/modules/authentication/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/data/models/app_configuration_model.dart';

abstract class IGetAuthenticatedUserRemotelyDatasource{
  Future<AuthenticatedUserResponseModel> getUserRemotely(AuthenticatedUserEntity params);
  Future<AppConfigurationModel> getAppConfig(String params);
}