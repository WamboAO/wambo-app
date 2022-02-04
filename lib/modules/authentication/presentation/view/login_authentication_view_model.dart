import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:interfaces/interfaces.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';

class LoginAuthenticationViewModel extends BaseViewModel
    with StatusCheckerMixin {
  LoginAuthenticationViewModel() {
    log.d('created');
  }
  final log = getLogger('LoginAuthenticationViewModel');
  // final _loginService = locator<LoginAuthenticationService>();
  // final _dialogService = locator<DialogService>();
  // final _socialAuthResponseService =
  //     locator<SocialAuthenticaionResponseService>();
  // final _startupViewModel = locator<StartupViewModel>();
  // final _socialAuthService = locator<SocialAuthenticationService>();

  // Future login({required String email, required String password}) async {
  //   setBusy(true);
  //   log.i("{email:$email password:$password}");
  //   UserRegistrationCredentialsEntity params =
  //       UserRegistrationCredentialsEntity(
  //           email: email,
  //           password: password,
  //           registrationType: "email/password", appToken: _startupViewModel.appConfig!.appToken);
  //   final result = await _loginService.login(params);
  //   statusChecker(result.status, onError: () async {
  //     await _dialogService.showDialog(
  //         title: "Erro", description: result.message);
  //     return setBusy(false);
  //   }, onComplete: () async {
  //     log.w(result.data!);
  //     await _startupViewModel.addDataLocaly(result.data!);
  //   });
  // }

  // Future loginWithSocial(Social social) async {
  //   setBusy(true);
  //   final result = await _socialAuthService.loginWithSocial(Social.facebook);
  //   statusChecker(result.status,
  //       onError: () async {
  //         await _dialogService.showDialog(
  //             title: "Erro", description: result.message);
  //         return setBusy(false);
  //       },
  //       onComplete: () => socialResponse(result.data!));
  // }

  // Future socialResponse(UserRegistrationCredentialsEntity params) async {
  //    UserRegistrationCredentialsEntity _params =
  //       UserRegistrationCredentialsEntity(
  //           email: params.email,
  //           firstName: params.firstName,
  //           lastName: params.lastName,
  //           avatar: params.avatar,
  //           registrationType: params.registrationType,
  //           appToken: _startupViewModel.appConfig!.appToken
  //           );
  //   final result = await _socialAuthResponseService.access(_params);
  //   statusChecker(result.status, onError: () async {
  //     await _dialogService.showDialog(
  //         title: "Erro", description: result.message);
  //     return setBusy(false);
  //   }, onComplete: () async {
  //     log.w(result.data!);
  //     await _startupViewModel.addDataLocaly(result.data!);
  //   });
  // }
}
