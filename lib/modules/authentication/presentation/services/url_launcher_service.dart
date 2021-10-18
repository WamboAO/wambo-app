import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/authentication/domain/usecases/url_launcher_usecase.dart';

class UrlLauncherService {
  UrlLauncherService(this.usecase);
  final UrlLauncherUsecase usecase;
  ApiResponse<void> response = ApiResponse.loading("loading...");

  Future<ApiResponse<void>> link(String params) async {
    final result = await usecase(params);
    response = result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    return response;
  }
}
