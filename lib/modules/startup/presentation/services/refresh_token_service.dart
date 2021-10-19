import 'package:wambo/app/locator.dart';
import 'package:wambo/core/interfaces/stoppable_interface.dart';
import 'package:wambo/core/mixins/status_checker_mixin.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/authentication/domain/entities/authentication_user_reponse_entity.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/domain/usecases/get_refresh_token_usecase.dart';
import 'package:wambo/modules/startup/presentation/services/app_config_service.dart';
import 'package:wambo/modules/startup/presentation/services/authentication_service.dart';
import 'package:wambo/modules/startup/presentation/services/startup_service.dart';
import 'package:wambo/app/setup.logger.dart';

class RefreshTokenService extends IstoppableService with StatusCheckerMixin {
  RefreshTokenService(this.usecase);
  final GetRefreshTokenUsecase usecase;
  final log = getLogger('RefreshTokenService');
  final _startupService = locator<StartupService>();
  final _appConfigService = locator<AppConfigService>();
  final _authenticationService = locator<AuthenticationService>();

  ApiResponse<AuthenticationUserReponseEntity> response =
      ApiResponse.loading("loading");

  Future<ApiResponse<AuthenticationUserReponseEntity>> refreshToken(
      AuthenticatedUserEntity params) async {
    final result = await usecase(params);

    response = result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });
    return response;
  }

  Future<void> init() async {
    if (_startupService.isLoggedIn == true) {
      var result = await refreshToken(_startupService.user);
      log.w("token refreshing :: $result");
      statusChecker(result.status,
          onError: () => print(result.message), //TODO: LOGOUT
          onComplete: () async => await addDataLocaly(result.data!));
    }
  }

  Future addDataLocaly(AuthenticationUserReponseEntity params) async {
    AuthenticatedUserEntity userAuth = AuthenticatedUserEntity(
        appToken: _appConfigService.appConfiguration!.appToken,
        token: params.token.token,
        refreshToken: params.token.refreshToken,
        userId: params.user.userId,
        firstName: params.user.firstName,
        email: params.user.email,
        lastName: params.user.lastName);
    final result =
        await _authenticationService.addAuthenticatedUserLocaly(userAuth);

    statusChecker(result.status,
        onError: () => print("object"),
        onComplete: () async =>
            await _startupService.getAuthenticatedUserLocaly());
  }

  @override

  // ignore: must_call_super
  Future<void> start() async {
    if (_startupService.isLoggedIn == true) {
      var result = await refreshToken(_startupService.user);
      log.w("token refreshing :: $result");
      statusChecker(result.status,
          onError: () => print(result.message), //TODO: LOGOUT
          onComplete: () async => await addDataLocaly(result.data!));
    }
  }

  @override
  // ignore: must_call_super
  void stop() {}
}
