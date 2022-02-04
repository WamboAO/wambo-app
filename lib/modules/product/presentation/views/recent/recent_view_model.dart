import 'package:stacked/stacked.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/app/setup.router.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/modules/product/domain/entities/products_entity.dart';
import 'package:interfaces/interfaces.dart';

class RecentViewModel extends StreamViewModel<ApiResponse<ProductsEntity>> {
  RecentViewModel() {
    log.d('created');
  }

  final log = getLogger('RecentViewModel');
  final _addSearchService = locator<AddSearchService>();
  final _getProductsService = locator<ProductsService>();
  final _navigationService = locator<NavigationService>();
  final _analyticsService = locator<AnalyticsService>();
  bool get isError => dataReady && data!.status == Status.error;
  bool get isLoading => dataReady && data!.status == Status.loading;
  bool get isComplete => dataReady && data!.status == Status.completed;
  ProductsEntity? get product =>
      dataReady && data!.status == Status.completed ? data!.data! : null;

  @override
  Stream<ApiResponse<ProductsEntity>> get stream =>
      _getProductsService.dataStream;

  Future goToSearch(
      {required String category, required NavChoice choice}) async {
    await _analyticsService.logSearch(category);
    await _addSearchService.addSearch(category);
    return _navigationService.navigateTo(StoreNavigatorRoutes.productsView,
        id: choice.nestedKeyValue(),
        arguments: ProductsViewArguments(search: category, choice: choice));
  }

  Future goToProduct(
      {required int index,
      required ProductDataEntity product,
      required NavChoice choice}) async {
    await _analyticsService.logProduct(
        id: product.id.toString(),
        itemListId: index.toString(),
        name: product.name,
        listName: "MAIN PRODUCTS",
        currency: product.currency,
        price: product.salePrice ?? product.price);
    return _navigationService.navigateTo(StoreNavigatorRoutes.productView,
        id: choice.nestedKeyValue(),
        arguments: ProductViewArguments(id: product.id, choice: choice));
  }
}
