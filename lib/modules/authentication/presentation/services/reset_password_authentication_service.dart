import 'package:wambo/core/shared/entities/generic_entity.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/domain/usecases/authentication_forgot_password_usecase.dart';

class ResetPasswordAuthenticationService {
  ResetPasswordAuthenticationService(this.usecase);
  final AuthenticationForgotPasswordUsecase usecase;

   ApiResponse<GenericEntity> response =
      ApiResponse.loading("loading...");

  Future<ApiResponse<GenericEntity>> reset(
      UserRegistrationCredentialsEntity params) async {
    final result = await usecase(params);
    response = result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    return response;
  }
}