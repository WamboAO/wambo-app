import 'package:wambo/app/imports.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/modules/authentication/domain/entities/authenticated_user_entity.dart';
import 'package:interfaces/interfaces.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';

class AuthenticationService {
  AuthenticationService(this.usecase);
  final AuthenticationUsecase usecase;
  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();
  ApiResponse<AuthenticatedUserEntity> response =
      ApiResponse.loading("loading...");

  Future<ApiResponse<AuthenticatedUserEntity>> login(
      UserRegistrationCredentialsEntity params) async {
    final result = await usecase(params);
    response = result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });
    _getAuthenticatedUserService.dataSink.add(response);
    return response;
  }
}
