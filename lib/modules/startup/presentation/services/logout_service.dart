import 'package:wambo/core/shared/entities/generic_entity.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/domain/usecases/authentication_logout_usecase.dart';

class LogoutService {
  LogoutService(this.usecase);
  final AuthenticationLogoutUsecase usecase;

  ApiResponse<GenericEntity> response = ApiResponse.loading("loading...");

  Future<ApiResponse<GenericEntity>> logout(
      AuthenticatedUserEntity parmas) async {
    final result = await usecase(parmas);

    response = result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    return response;
  }
}
