import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/startup/domain/usecases/authenticated_user_delete_usecase.dart';

class DeleteAuthService {
  DeleteAuthService(this.usecase);
  final AuthenticatedUserDeleteUsecase usecase;

  ApiResponse<bool> response = ApiResponse.loading("loading...");

  Future<ApiResponse<bool>> deleteAuth(
      NoParams params) async {
    final result = await usecase(params);

    response = result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    return response;
  }
}