import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/startup/presentation/services/get_authenticated_user_service.dart';
import 'package:wambo/modules/store/presentation/services/get_categories_service.dart';
import 'package:wambo/modules/store/presentation/services/get_products_service.dart';
import 'package:wambo/modules/store/presentation/services/get_store_info_service.dart';

class StoreViewModel extends BaseViewModel {
  StoreViewModel() {
    log.d('created');
  }

  final log = getLogger('StoreViewModel');
  final _getCategoriesService = locator<GetCategoriesService>();
  final _getStoreInfoService = locator<GetStoreInfoService>();
  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();
  final _getProductsService = locator<GetProductsService>();
  final _getPromosService = locator<GetPromoService>();
  final _getPopularService = locator<GetPopularService>();
  final _getRecentService = locator<GetRecentService>();
  final _getForYouService = locator<GetForYouService>();

  Future int() async {
    await _getCategoriesService.getCategories(
        config: PageConfigEntity(
      perPage: 9,
      page: 1,
      appToken: _getAuthenticatedUserService.currentUser!.appToken!,
    ));

    await Future.wait([
      _getStoreInfoService.getStoreInfo(
          config: PageConfigEntity(
        appToken: _getAuthenticatedUserService.currentUser!.appToken!,
      )),
      _getPromosService.getPromos(),
      _getPopularService.getPopular(),
      _getRecentService.getRecent(),
      _getForYouService.getForYou()
    ]);
    await _getProductsService.getProducts(
        config: PageConfigEntity(
      perPage: 15,
      page: 1,
      productType: ProductType.all,
      appToken: _getAuthenticatedUserService.currentUser!.appToken!,
    ));
  }



  goToCart() {}

  goToSearch() {}
}
