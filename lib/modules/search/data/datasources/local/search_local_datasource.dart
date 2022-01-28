import 'package:wambo/modules/search/data/models/search_items_model.dart';
import 'package:wambo/modules/search/domain/entities/search_items_entity.dart';

abstract class ISearchLocalDatasource {
  Future<SearchItemsModel> getItems();
  Future<int> addItems(String params);
}
