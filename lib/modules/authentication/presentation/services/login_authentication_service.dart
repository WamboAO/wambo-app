import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/authentication/domain/entities/authentication_user_reponse_entity.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/domain/usecases/authentication_login_usecase.dart';

class LoginAuthenticationService {
  LoginAuthenticationService(this.usecase);
  final AuthenticationLoginUsecase usecase;

   ApiResponse<AuthenticationUserReponseEntity> response =
      ApiResponse.loading("loading...");

  Future<ApiResponse<AuthenticationUserReponseEntity>> login(
      UserRegistrationCredentialsEntity params) async {
    final result = await usecase(params);
    response = result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    return response;
  }
}