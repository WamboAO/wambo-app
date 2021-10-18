import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/core/mixins/status_checker_mixin.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/authentication/domain/entities/authentication_user_reponse_entity.dart';
import 'package:wambo/modules/startup/domain/entities/app_configuration_entity.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/presentation/services/startup_service.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.router.dart';


class StartupViewModel extends BaseViewModel with StatusCheckerMixin{
  //LOCATOR
  final _startupService = locator<StartupService>();
  final _appConfigService = locator<AppConfigService>();
  final _snackbarService = locator<SnackbarService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
   final _authenticationService = locator<AuthenticationService>();
  //ENV VARIABLE SETUP
  get env => dotenv.env['ENVIROMENT'];
  //GLOBAL KEY FOR SERVICERS
  GlobalKey<NavigatorState>? get globalKey => StackedService.navigatorKey;
  Locale get aoLocale => const Locale('pt', 'pt_AO');
  
  //CURRENT USER INFO
  bool get isLoggedIn => _startupService.isLoggedIn;
  AppConfigurationEntity? get appConfig => _appConfigService.appConfiguration;
  Stream<ApiResponse<AuthenticatedUserEntity>> get currentUser => _startupService.currentUser;
  AuthenticatedUserEntity get noAuthUser => AuthenticatedUserEntity(
        token: "NO TOKEN",
        email: "",
        userId: 0,
        avatar: "",
        firstName: "",
        lastName: "",
        phone: "",
        refreshToken: "",
      );
void setSnackBar() {

    _snackbarService.registerSnackbarConfig(SnackbarConfig(
        snackStyle: SnackStyle.GROUNDED,
        animationDuration: const Duration(milliseconds: 300),
        messageColor: Colors.white,
        messageTextAlign: TextAlign.center));
  }
  Future get getAuthenticatedUserLocaly => _startupService.getAuthenticatedUserLocaly();

  Future addDataLocaly(AuthenticationUserReponseEntity params) async {
    AuthenticatedUserEntity userAuth = AuthenticatedUserEntity(
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
}
