import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/app/setup.router.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/modules/product/domain/entities/products_entity.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/product/presentation/services/get_products_service.dart';

class PopularViewModel extends StreamViewModel<ApiResponse<ProductsEntity>> {
  PopularViewModel() {
    log.d('created');
  }

  final log = getLogger('PopularViewModel');
  final _getPopularService = locator<GetPopularService>();
  final _navigationService = locator<NavigationService>();
  bool get isError => dataReady && data!.status == Status.error;
  bool get isLoading => dataReady && data!.status == Status.loading;
  bool get isComplete => dataReady && data!.status == Status.completed;
  ProductsEntity? get product =>
      dataReady && data!.status == Status.completed ? data!.data! : null;

  @override
  Stream<ApiResponse<ProductsEntity>> get stream =>
      _getPopularService.dataStream;

  goToBlock() {}

   Future goToProduct({required int id, required NavChoice choice}) async {
    return _navigationService.navigateTo(StoreNavigatorRoutes.productView,
        id: choice.nestedKeyValue(),
        arguments: ProductViewArguments(id: id, choice: choice));
  }
}
