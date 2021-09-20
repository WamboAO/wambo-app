import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/core/app/locator.dart';
import 'package:wambo/core/app/setup.logger.dart';
import 'package:wambo/features/startup/presentation/services/startup_service.dart';


class AuthenticationViewModel extends BaseViewModel {

  AuthenticationViewModel(){
   log.d('created');
 }
 final log = getLogger('AuthenticationViewModel');
 final _startupService = locator<StartupService>();
 final _navigationService = locator<NavigationService>();
 bool get isLoggedin => _startupService.isLoggedIn;

 Future initialize() async{
    //TODO: reset token here
 }

 Future goToLogin() async {
   //TODO: go to login view
 }
 

 

}