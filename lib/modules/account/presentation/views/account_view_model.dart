import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/setup.logger.dart';


class AccountViewModel extends BaseViewModel {

 AccountViewModel(){
   log.d('created');
 }

 final log = getLogger('AccountViewModel');

}