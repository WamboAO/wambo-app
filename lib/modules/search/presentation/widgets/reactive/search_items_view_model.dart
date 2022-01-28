import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/search/domain/entities/search_items_entity.dart';
import 'package:wambo/modules/search/presentation/services/search_service.dart';


class SearchItemsViewModel extends StreamViewModel<ApiResponse<SearchItemsEntity>> {

 SearchItemsViewModel(){
   log.d('created');
 }

 final log = getLogger('SearchItemsViewModel');
  final _searchService = locator<SearchService>();
    final _addSearchService = locator<AddSearchService>();

  bool get isError => dataReady && data!.status == Status.error;
  bool get isLoading => dataReady && data!.status == Status.loading;
  bool get isComplete => dataReady && data!.status == Status.completed;
  SearchItemsEntity? get items =>
      dataReady && data!.status == Status.completed ? data!.data! : null;


  Future goToProducts({required String text, required NavChoice choice}) async {
    final result = await _addSearchService.addSearch(text);
    log.w(result);
    
  }

  @override
  Stream<ApiResponse<SearchItemsEntity>> get stream =>
      _searchService.dataStream;
}