import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/mixins/status_checker_mixin.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/authentication/domain/entities/authentication_user_reponse_entity.dart';
import 'package:wambo/modules/startup/domain/entities/app_configuration_entity.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/presentation/services/delete_auth_service.dart';
import 'package:wambo/modules/startup/presentation/services/refresh_token_service.dart';
import 'package:wambo/modules/startup/presentation/services/startup_service.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.router.dart';

class StartupViewModel extends FutureViewModel with StatusCheckerMixin {
  //LOCATOR
  final _startupService = locator<StartupService>();
  final _appConfigService = locator<AppConfigService>();
  final _snackbarService = locator<SnackbarService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  final _refreshTokenService = locator<RefreshTokenService>();
  final _logoutService = locator<LogoutService>();
  final _deleteAuthService = locator<DeleteAuthService>();
  //ENV VARIABLE SETUP
  get env => dotenv.env['ENVIROMENT'];
  //GLOBAL KEY FOR SERVICERS
  GlobalKey<NavigatorState>? get globalKey => StackedService.navigatorKey;
  Locale get aoLocale => const Locale('pt', 'pt_AO');

  //CURRENT USER INFO
  bool get isLoggedIn => _startupService.isLoggedIn;
  AppConfigurationEntity? get appConfig => _appConfigService.appConfiguration;
  Stream<ApiResponse<AuthenticatedUserEntity>> get currentUser =>
      _startupService.currentUser;
  AuthenticatedUserEntity get user => _startupService.user;
  AuthenticatedUserEntity get noAuthUser => AuthenticatedUserEntity(
        token: "NO TOKEN",
        email: "",
        userId: 0,
        avatar: "",
        firstName: "",
        appToken: appConfig!.appToken,
        lastName: "",
        phone: "",
        refreshToken: "",
      );
  Future<void> setSnackBar() async {
    _snackbarService.registerSnackbarConfig(SnackbarConfig(
        snackStyle: SnackStyle.GROUNDED,
        animationDuration: const Duration(milliseconds: 300),
        messageColor: Colors.white,
        messageTextAlign: TextAlign.center));
  }

  Future get getAuthenticatedUserLocaly =>
      _startupService.getAuthenticatedUserLocaly();

  Future addDataLocaly(AuthenticationUserReponseEntity params) async {
    AuthenticatedUserEntity userAuth = AuthenticatedUserEntity(
        appToken: appConfig!.appToken,
        token: params.token.token,
        refreshToken: params.token.refreshToken,
        userId: params.user.userId,
        firstName: params.user.firstName,
        email: params.user.email,
        lastName: params.user.lastName);
    final result =
        await _authenticationService.addAuthenticatedUserLocaly(userAuth);

    statusChecker(result.status, onError: () async {
      await _dialogService.showDialog(
          title: "Erro", description: result.message);
      return setBusy(false);
    }, onComplete: () async {
      await getAuthenticatedUserLocaly;
      setBusy(false);
      await _navigationService.replaceWith(Routes.mainView);
    });
  }

  Future logout() async {
    var result = await _logoutService.logout(user);
    statusChecker(result.status, onError: () async {
      //TODO social logout here
     return await _deleteAuthService.deleteAuth(NoParams());
    }, onComplete: () async {
      return await _navigationService
          .replaceWith(Routes.mainAuthenticationView);
    });
  }

  @override
  Future futureToRun() => _refreshTokenService.init();
}
