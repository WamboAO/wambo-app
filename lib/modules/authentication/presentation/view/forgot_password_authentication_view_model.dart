import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/core/mixins/status_checker_mixin.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/presentation/services/reset_password_authentication_service.dart';

class ForgotPasswordAuthenticationViewModel extends BaseViewModel
    with StatusCheckerMixin {
  ForgotPasswordAuthenticationViewModel() {
    log.d('created');
  }

  final log = getLogger('ForgotPasswordAuthenticationViewModel');
  final _resetPasswordService = locator<ResetPasswordAuthenticationService>();
  final _dialogService = locator<DialogService>();
  final _snackbarService = locator<SnackbarService>();

  Future resetPassword({required String email}) async {
    setBusy(true);
    log.i("{email:$email}");
    UserRegistrationCredentialsEntity params =
        UserRegistrationCredentialsEntity(
            email: email, registrationType: "email/password");
    final result = await _resetPasswordService.reset(params);
    statusChecker(result.status, onError: () async {
      await _dialogService.showDialog(
          title: "Erro", description: result.message);
      return setBusy(false);
    }, onComplete: () async {
      log.w(result.data!);
      setBusy(false);
      _snackbarService.showSnackbar(message: result.data!.message);
    });
  }
}
