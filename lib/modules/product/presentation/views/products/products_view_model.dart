import 'package:firebase/firebase.dart';
import 'package:interfaces/interfaces.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/app/setup.router.dart';

import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/modules/product/domain/entities/products_entity.dart';
import 'package:wambo/modules/product/presentation/services/get_products_service.dart';

class ProductsViewModel extends StreamViewModel<ApiResponse<ProductsEntity>> {
  ProductsViewModel() {
    log.d('created');
  }

  final log = getLogger('ProductsViewModel');
  final _getProductsService = locator<ProductsService>();
  final _navigationService = locator<NavigationService>();
  final _analyticsService = locator<AnalyticsService>();
  bool get isError => dataReady && data!.status == Status.error;
  bool get isLoading => dataReady && data!.status == Status.loading;
  bool get isComplete => dataReady && data!.status == Status.completed;
  ProductsEntity? get product =>
      dataReady && data!.status == Status.completed ? data!.data! : null;

  bool goBack(NavChoice choice) {
    return _navigationService.back(id: choice.nestedKeyValue());
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

  // @override
  // Future<ApiResponse<ProductsEntity>> futureToRun() =>
  //     _getProductsService.getProducts(true);

  @override
  // TODO: implement stream
  Stream<ApiResponse<ProductsEntity>> get stream =>
      _getProductsService.dataStream;
}
