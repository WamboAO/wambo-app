import 'package:rxdart/rxdart.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/startup/domain/entities/app_configuration_entity.dart';
import 'package:wambo/modules/startup/domain/usecases/app_configuration_setup_usecase.dart';

class AppConfigService {
  AppConfigService(this.usecase);
  final AppConfigurationSetupUsecase usecase;

  final BehaviorSubject<ApiResponse<AppConfigurationEntity>> _response =
      BehaviorSubject<ApiResponse<AppConfigurationEntity>>.seeded(
          ApiResponse.loading("loading..."));

 AppConfigurationEntity? get appConfiguration => _response.value.data;

  Future appConfig() async {
    final result = await usecase(NoParams());

    ApiResponse<AppConfigurationEntity> response =
        result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    _response.sink.add(response);
  }
}
