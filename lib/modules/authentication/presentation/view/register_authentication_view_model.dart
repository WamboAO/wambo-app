import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:interfaces/interfaces.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';

class RegisterAuthenticationViewModel extends BaseViewModel
    with StatusCheckerMixin {
  RegisterAuthenticationViewModel() {
    log.d('created');
  }
  final log = getLogger('RegisterAuthenticationViewModel');
  // final _registerAuthService = locator<RegisterAuthenticationService>();
  // final _dialogService = locator<DialogService>();
  // final _startupViewModel = locator<StartupViewModel>();
  // final _socialAuthService = locator<SocialAuthenticationService>();
  // final _socialAuthResponseService =
  //     locator<SocialAuthenticaionResponseService>();
  // final _urlLauncherService = locator<UrlLauncherService>();

  // Future register(
  //     {required String email,
  //     required String fname,
  //     required String lname,
  //     required String password,
  //     required String phone}) async {
  //   setBusy(true);
  //   log.i(
  //       "{email:$email, name: $fname, last_name:$lname, password:$password, phone:$phone}");
  //   UserRegistrationCredentialsEntity params =
  //       UserRegistrationCredentialsEntity(
  //           email: email,
  //           firstName: fname,
  //           lastName: lname,
  //           phone: phone,
  //           password: password,
  //           registrationType: "email/password",
  //           appToken: _startupViewModel.appConfig!.appToken);
  //   final result = await _registerAuthService.signup(params);
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
  //       onComplete: () async => await socialResponse(result.data!));
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

  // Future getLink(String params) async {
  //   final result = await _urlLauncherService.link(params);
  //   statusChecker(result.status,
  //       onError: () async => await _dialogService.showDialog(
  //           title: "Erro", description: result.message),
  //       onComplete: () => null);
  // }
}
