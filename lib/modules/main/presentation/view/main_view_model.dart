import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/app/setup.router.dart';
import 'package:wambo/core/mixins/facebook_login_mixin.dart';
import 'package:wambo/modules/startup/presentation/view/startup_view_model.dart';

class MainViewModel extends BaseViewModel with FacebookLoginMixin {
  MainViewModel() {
    log.d('created');
  }
  final log = getLogger('MainViewModel');
  final _startupViewModel = locator<StartupViewModel>();
  final _navigationService = locator<NavigationService>();

  Future logout() async {
    if (_startupViewModel.isLoggedIn == true) {
      setBusy(true);
      await facebookLogout();
      await _startupViewModel.logout().then((value) => setBusy(false));
    } else {
      return await _navigationService
          .replaceWith(Routes.mainAuthenticationView);
    }
  }
}
