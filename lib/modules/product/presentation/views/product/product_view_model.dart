import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/product/domain/entities/products_entity.dart';

class ProductViewModel extends FutureViewModel<ApiResponse<ProductEntity>> {
  ProductViewModel(this.id) {
    log.d('created');
  }
  final int id;
  final log = getLogger('ProductViewModel');
  final _productService = locator<ProductService>();
  bool get isError => dataReady && data!.status == Status.error;
  bool get isLoading => dataReady && data!.status == Status.loading;
  bool get isComplete => dataReady && data!.status == Status.completed;
  ProductEntity? get product =>
      dataReady && data!.status == Status.completed ? data!.data! : null;

  @override
  Future<ApiResponse<ProductEntity>> futureToRun() =>
      _productService.getProduct(id: id);
}