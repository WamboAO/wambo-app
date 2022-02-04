import 'package:stacked/stacked.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/app/setup.router.dart';

import 'package:interfaces/interfaces.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/modules/posters/domain/entities/store_info_entity.dart';

class StoreInfoViewModel extends StreamViewModel<ApiResponse<StoreInfoEntity>> {
  StoreInfoViewModel() {
    log.d('created');
  }

  final log = getLogger('StoreInfoViewModel');
   final _addSearchService = locator<AddSearchService>();
  final _navigationService = locator<NavigationService>();
    final _analyticsService = locator<AnalyticsService>();

  final _getStoreInfoService = locator<GetStoreInfoService>();
  bool get isError => dataReady && data!.status == Status.error;
  bool get isLoading => dataReady && data!.status == Status.loading;
  bool get isComplete => dataReady && data!.status == Status.completed;
  StoreInfoEntity? get store =>
      dataReady && data!.status == Status.completed ? data!.data! : null;
  @override
  Stream<ApiResponse<StoreInfoEntity>> get stream =>
      _getStoreInfoService.dataStream;

  int _currentIndex = 0;
  get currentIndex => _currentIndex;

  setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future goToSearch({required String category, required NavChoice choice}) async{
    await _analyticsService.logSearch(category);
    await _addSearchService.addSearch(category);
     return _navigationService.navigateTo(StoreNavigatorRoutes.productsView,
        id: choice.nestedKeyValue(),
        arguments: ProductsViewArguments(search: category, choice: choice));
  }
}
