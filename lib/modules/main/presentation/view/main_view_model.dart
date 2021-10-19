import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/modules/startup/presentation/services/refresh_token_service.dart';

class MainViewModel extends BaseViewModel {
  MainViewModel() {
    log.d('created');
  }
  final log = getLogger('MainViewModel');
  
  
}
