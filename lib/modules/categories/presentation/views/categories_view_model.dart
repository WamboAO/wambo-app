import 'package:stacked/stacked.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/app/setup.router.dart';
import 'package:interfaces/interfaces.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/categories/domain/entities/categories_entity.dart';

class CategoriesViewModel
    extends StreamViewModel<ApiResponse<CategoriesEntity>> {
  CategoriesViewModel() {
    log.d('created');
  }

  final log = getLogger('CategoriesViewModel');
  final _addSearchService = locator<AddSearchService>();
  final _navigationService = locator<NavigationService>();
  final _analyticsService = locator<AnalyticsService>();
  final _getCategoriesService = locator<GetCategoriesService>();
  bool get isError => dataReady && data!.status == Status.error;
  bool get isLoading => dataReady && data!.status == Status.loading;
  bool get isComplete => dataReady && data!.status == Status.completed;
  CategoriesEntity? get categories =>
      dataReady && data!.status == Status.completed ? data!.data! : null;

  @override
  Stream<ApiResponse<CategoriesEntity>> get stream =>
      _getCategoriesService.dataStream;

 Future goToSearch({required String category, required NavChoice choice}) async{
    await _analyticsService.logSearch(category);
    await _addSearchService.addSearch(category);
     return _navigationService.navigateTo(StoreNavigatorRoutes.productsView,
        id: choice.nestedKeyValue(),
        arguments: ProductsViewArguments(search: category, choice: choice));
  }
}



