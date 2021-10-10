import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/app/setup.router.dart';
import 'package:wambo/core/mixins/status_checker_mixin.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/features/authentication/presentation/services/authentication_service.dart';
import 'package:wambo/features/authentication/presentation/services/social_authentication_service.dart';
import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/features/startup/presentation/view/startup_view_model.dart';

class AuthenticationViewModel extends BaseViewModel with StatusCheckerMixin {
  AuthenticationViewModel() {
    log.d('created');
  }
  //LOCATOR
  final log = getLogger('AuthenticationViewModel');
  final _navigationService = locator<NavigationService>();
  final _authenticateService = locator<AuthenticationService>();
  final _startupViewModel = locator<StartupViewModel>();
  final _dialogService = locator<DialogService>();
  final _socialAuthService = locator<SocialAuthenticationService>();

  //USER INFO
  AuthenticatedUserEntity get noAuthUser => _startupViewModel.noAuthUser;

  //CANCEL - BUTTON
  Future cancelAuthentication() async {
    log.i(noAuthUser);
    final result =
        await _authenticateService.addAuthenticatedUserLocaly(noAuthUser);
    statusChecker(result.status,
        onError: () async => await _dialogService.showDialog(
            title: "Erro", description: result.message),
        onComplete: () async => await getAuthenticatedUserGoToMain());
  }

  //TODO: LOGIN - BUTTON
  //TODO: FACEBOOK - BUTTON
  Future loginWithFacebook() async {
    final result = await _socialAuthService.loginWithSocial(Social.facebook);
    statusChecker(result.status,
        onError: () async => await _dialogService.showDialog(
            title: "Erro", description: result.message),
        onComplete: () => print(""));
  }
  //TODO: APPLE - BUTTON ONLY FOR IOS
  Future loginWithApple() async {
    final result = await _socialAuthService.loginWithSocial(Social.apple);
    statusChecker(result.status,
        onError: () async => await _dialogService.showDialog(
            title: "Erro", description: result.message),
        onComplete: () => print(""));
  }
  //TODO: TERMS - BUTTON
  //TODO: PRIVACY - BUTTON

  //GET USER AUTH AND GO TO MAIN
  Future getAuthenticatedUserGoToMain() async {
    await _startupViewModel.getAuthenticatedUserLocaly;
    return await _navigationService.replaceWith(Routes.mainView);
  }
}
