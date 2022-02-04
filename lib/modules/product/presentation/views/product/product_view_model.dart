import 'dart:io';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:interfaces/interfaces.dart';
import 'package:wambo/modules/product/domain/entities/products_entity.dart';

class ProductViewModel extends FutureViewModel<ApiResponse<ProductEntity>> {
  ProductViewModel(this.id) {
    log.d('created');
  }
  final int id;
  final log = getLogger('ProductViewModel');
  final _productService = locator<ProductService>();
  final _urlLauncherService = locator<UrlLauncherService>();
  bool get isError => dataReady && data!.status == Status.error;
  bool get isLoading => dataReady && data!.status == Status.loading;
  bool get isComplete => dataReady && data!.status == Status.completed;
  ProductEntity? get product =>
      dataReady && data!.status == Status.completed ? data!.data! : null;
  int _index = 0;
  int get currentIndex => _index;

  @override
  Future<ApiResponse<ProductEntity>> futureToRun() =>
      _productService.getProduct(id: id);

  setIndex(int index) {
    _index = index;
    notifyListeners();
  }

  goToSearch({category}) {}

  Future url(String link) async {
    await _urlLauncherService.link(link);
  }
}
