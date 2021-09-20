import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/features/startup/domain/entities/generic_entity.dart';
import 'package:wambo/features/startup/domain/usecases/add_authenticated_user_localy_usecase.dart';

class AuthService {
  AuthService(this.usecase);
  final AddAuthenticatedUserLocaly usecase;

  ApiResponse<GenericEntity> response = ApiResponse.loading("loading...");

  Future<ApiResponse<GenericEntity>> addAuthenticatedUserLocaly(
      AuthenticatedUserEntity userAuth) async {
    final result = await usecase(userAuth);

    response = result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    return response;
  }
}
