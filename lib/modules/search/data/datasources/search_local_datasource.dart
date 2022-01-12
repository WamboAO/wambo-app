import 'package:wambo/modules/search/data/models/search_items_model.dart';

abstract class ISearchLocalDatasource {
  Future<SearchItemsModel> getItems();
  
}
