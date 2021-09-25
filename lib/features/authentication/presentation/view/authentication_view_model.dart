import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/app/setup.router.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/features/authentication/presentation/services/authentication_service.dart';
import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';

class AuthenticationViewModel extends BaseViewModel {
  AuthenticationViewModel() {
    log.d('created');
  }
  final log = getLogger('AuthenticationViewModel');
  final _navigationService = locator<NavigationService>();
  final _authenticateService = locator<AuthenticationService>();

  Future cancelAuthentication() async {
    AuthenticatedUserEntity userAuth = AuthenticatedUserEntity(
        token: "NO TOKEN",
        userId: 0,
        avatar: "",
        username: "",
        refreshToken: "",
        isFirstTime: false);
    log.i(userAuth);
    final result =
        await _authenticateService.addAuthenticatedUserLocaly(userAuth);
    switch (result.status) {
      case Status.loading:
      case Status.error:
        break;

      case Status.completed:
        return await _navigationService.replaceWith(Routes.mainView);
    }
  }
}
