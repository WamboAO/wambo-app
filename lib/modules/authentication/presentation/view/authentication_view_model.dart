import 'package:stacked/stacked.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:interfaces/interfaces.dart';
class AuthenticationViewModel extends BaseViewModel with StatusCheckerMixin {
  AuthenticationViewModel() {
    log.d('created');
  }
  // //LOCATOR
   final log = getLogger('AuthenticationViewModel');
  // final _navigationService = locator<NavigationService>();
  // final _authenticateService = locator<AuthenticationService>();
  // final _startupViewModel = locator<StartupViewModel>();
  // final _dialogService = locator<DialogService>();
  // final _socialAuthService = locator<SocialAuthenticationService>();
  // final _socialAuthResponseService =
  //     locator<SocialAuthenticaionResponseService>();
  // final _urlLauncherService = locator<UrlLauncherService>();

  // //USER INFO
  // AuthenticatedUserEntity get noAuthUser => _startupViewModel.noAuthUser;

  // //CANCEL - BUTTON
  // Future cancelAuthentication() async {
  //   log.i(noAuthUser);
  //   final result =
  //       await _authenticateService.addAuthenticatedUserLocaly(noAuthUser);
  //   statusChecker(result.status,
  //       onError: () async => await _dialogService.showDialog(
  //           title: "Erro", description: result.message),
  //       onComplete: () async => await getAuthenticatedUserGoToMain());
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
  //   UserRegistrationCredentialsEntity _params =
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

  // //GET USER AUTH AND GO TO MAIN
  // Future getAuthenticatedUserGoToMain() async {
  //   await _startupViewModel.getAuthenticatedUserLocaly;
  //   return await _navigationService.replaceWith(Routes.mainView);
  // }
}
