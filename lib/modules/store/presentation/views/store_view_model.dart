import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/app/setup.router.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/startup/presentation/services/get_authenticated_user_service.dart';
import 'package:wambo/modules/categories/presentation/services/get_categories_service.dart';
import 'package:wambo/modules/product/presentation/services/get_products_service.dart';
import 'package:wambo/modules/posters/presentation/services/get_store_info_service.dart';

class StoreViewModel extends BaseViewModel {
  StoreViewModel() {
    log.d('created');
  }

  final log = getLogger('StoreViewModel');
  final _navigationService = locator<NavigationService>();
  final _getCategoriesService = locator<GetCategoriesService>();
  final _getStoreInfoService = locator<GetStoreInfoService>();
  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();
  final _getProductsService = locator<ProductsService>();
  final _getPromosService = locator<GetPromoService>();
  final _getPopularService = locator<GetPopularService>();
  final _getRecentService = locator<GetRecentService>();
  final _getForYouService = locator<GetForYouService>();
  final _getSuggestionService = locator<GetSuggestionService>();

  NavChoice get choice => NavChoice.home;

  Future int() async {
    await Future.wait([
      _getCategoriesService.getCategories(true),
      _getStoreInfoService.getStoreInfo(
          isRefresh: true,
          config: PageConfigEntity(
            appToken: _getAuthenticatedUserService.currentUser!.appToken!,
          )),
      _getPromosService.getPromos(true),
      _getPopularService.getPopular(true),
      _getRecentService.getRecent(true),
      _getSuggestionService.getSuggestions(true),
      _getForYouService.getForYou(true)
    ]);
    await _getProductsService.getProducts(true);
  }

  goToCart() {}

  Future goToSearch(NavChoice choice) async {
    return _navigationService.navigateTo(StoreNavigatorRoutes.searchView,
        id: choice.nestedKeyValue(),
        arguments: SearchViewArguments(choice: choice));
  }
}
