import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/domain/usecases/add_authenticated_user_localy_usecase.dart';

class AuthenticationService {
  AuthenticationService(this.usecase);
  final AddAuthenticatedUserLocaly usecase;

  ApiResponse<bool> response = ApiResponse.loading("loading...");

  Future<ApiResponse<bool>> addAuthenticatedUserLocaly(
      AuthenticatedUserEntity userAuth) async {
    final result = await usecase(userAuth);

    response = result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    return response;
  }
}
