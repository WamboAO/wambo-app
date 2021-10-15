import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/app/setup.router.dart';
import 'package:wambo/core/mixins/status_checker_mixin.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/startup/presentation/services/authentication_service.dart';
import 'package:wambo/modules/authentication/presentation/services/social_authentication_service.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/presentation/view/startup_view_model.dart';

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
  //TODO: SOCIAL - BUTTON
  Future loginWithSocial(Social social) async {
    final result = await _socialAuthService.loginWithSocial(Social.facebook);
    statusChecker(result.status,
        onError: () async => await _dialogService.showDialog(
            title: "Erro", description: result.message),
        onComplete: () => log.wtf(result.data));
  }
  
  //TODO: TERMS - BUTTON
  //TODO: PRIVACY - BUTTON

  //GET USER AUTH AND GO TO MAIN
  Future getAuthenticatedUserGoToMain() async {
    await _startupViewModel.getAuthenticatedUserLocaly;
    return await _navigationService.replaceWith(Routes.mainView);
  }
}
