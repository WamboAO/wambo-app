import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/authentication/domain/entities/authentication_user_reponse_entity.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/domain/usecases/authentication_social_response_usecase.dart';
import 'package:wambo/modules/authentication/domain/usecases/authentication_with_social_usecase.dart';

class SocialAuthenticationService {
  SocialAuthenticationService(this.usecase);
  final AuthenticationWithSocialUsecase usecase;

  ApiResponse<UserRegistrationCredentialsEntity> response =
      ApiResponse.loading("loading...");
  Future<ApiResponse<UserRegistrationCredentialsEntity>> loginWithSocial(
      Social social) async {
    final result = await usecase(social);
    response = result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    return response;
  }
}

class SocialAuthenticaionResponseService {
  SocialAuthenticaionResponseService(this.usecase);
  final AuthenticationSocialResponseUsecase usecase;
  ApiResponse<AuthenticationUserReponseEntity> response =
      ApiResponse.loading("loading...");

  Future<ApiResponse<AuthenticationUserReponseEntity>> access(
      UserRegistrationCredentialsEntity params) async {
    final result = await usecase(params);
    response = result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    return response;
  }
}
