import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/setup.logger.dart';


class CartViewModel extends BaseViewModel {

 CartViewModel(){
   log.d('created');
 }

 final log = getLogger('CartViewModel');

}