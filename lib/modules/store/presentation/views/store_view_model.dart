import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/store/domain/entities/store_info_entity.dart';
import 'package:wambo/modules/store/presentation/services/get_store_info_service.dart';


class StoreViewModel extends StreamViewModel<ApiResponse<StoreInfoEntity>> {

 StoreViewModel(){
   log.d('created');
 }

 final log = getLogger('StoreViewModel');
 final _getStoreInfoService = locator<GetStoreInfoService>();

  @override

  Stream<ApiResponse<StoreInfoEntity>> get stream => _getStoreInfoService.dataStream;

}

