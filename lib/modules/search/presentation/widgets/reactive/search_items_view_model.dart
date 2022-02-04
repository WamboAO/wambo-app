import 'package:stacked/stacked.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/app/setup.router.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:interfaces/interfaces.dart';
import 'package:wambo/modules/search/domain/entities/search_items_entity.dart';


class SearchItemsViewModel extends StreamViewModel<ApiResponse<SearchItemsEntity>> {

 SearchItemsViewModel(){
   log.d('created');
 }

 final log = getLogger('SearchItemsViewModel');
  final _searchService = locator<SearchService>();
  final _navigationService = locator<NavigationService>();
    final _addSearchService = locator<AddSearchService>();
final _analyticsService = locator<AnalyticsService>();
  bool get isError => dataReady && data!.status == Status.error;
  bool get isLoading => dataReady && data!.status == Status.loading;
  bool get isComplete => dataReady && data!.status == Status.completed;
  SearchItemsEntity? get items =>
      dataReady && data!.status == Status.completed ? data!.data! : null;


  Future goToProducts({required String text, required NavChoice choice}) async {
    
    await _analyticsService.logSearch(text);
    final result = await _addSearchService.addSearch(text);
         return _navigationService.navigateTo(StoreNavigatorRoutes.productsView,
        id: choice.nestedKeyValue(),
        arguments: ProductsViewArguments(search: text, choice: choice));
    
  }

  @override
  Stream<ApiResponse<SearchItemsEntity>> get stream =>
      _searchService.dataStream;
}