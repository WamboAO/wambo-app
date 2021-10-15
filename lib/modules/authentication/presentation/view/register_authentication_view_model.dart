import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/app/setup.router.dart';
import 'package:wambo/core/mixins/status_checker_mixin.dart';
import 'package:wambo/modules/authentication/domain/entities/authentication_user_reponse_entity.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/presentation/services/register_authentication_service.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';

class RegisterAuthenticationViewModel extends BaseViewModel
    with StatusCheckerMixin {
  RegisterAuthenticationViewModel() {
    log.d('created');
  }
  final log = getLogger('RegisterAuthenticationViewModel');
  final _registerAuthService = locator<RegisterAuthenticationService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  final _startupViewModel = locator<StartupViewModel>();

  Future register(
      {required String email,
      required String fname,
      required String lname,
      required String password,
      required String phone}) async {
    setBusy(true);
    log.i(
        "{email:$email, name: $fname, last_name:$lname, password:$password, phone:$phone}");
    UserRegistrationCredentialsEntity params =
        UserRegistrationCredentialsEntity(
            email: email,
            firstName: fname,
            lastName: lname,
            phone: phone,
            password: password,
            registrationType: "email/password");
    final result = await _registerAuthService.signup(params);
    statusChecker(result.status,
        onError: () async => await _dialogService.showDialog(
            title: "Erro", description: result.message),
        onComplete: () async {
          log.w(result.data!);
          await addDataLocaly(result.data!);
        });
  }

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
      await _startupViewModel.getAuthenticatedUserLocaly;
      setBusy(false);
      await _navigationService.replaceWith(Routes.mainView);
    });
  }
}
