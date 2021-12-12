import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/modules/store/presentation/services/get_categories_service.dart';
import 'package:wambo/modules/store/presentation/services/get_store_info_service.dart';

class StoreViewModel extends BaseViewModel {
  StoreViewModel() {
    log.d('created');
  }

  final log = getLogger('StoreViewModel');
  final _getCategoriesService = locator<GetCategoriesService>();
  final _getStoreInfoService = locator<GetStoreInfoService>();

  Future int() async {
    await _getCategoriesService.getCategories();
    await _getStoreInfoService.getStoreInfo();
  }

  goToQRcode() {}

  goToCart() {}

  goToSearch() {}
}
