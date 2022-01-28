import 'package:local/local.dart';
import 'package:wambo/modules/search/data/datasources/local/search_local_datasource.dart';
import 'package:wambo/modules/search/data/models/search_items_model.dart';

import '../search_data.dart';

class SearchLocalDatasourceImplementation implements ISearchLocalDatasource {
  SearchLocalDatasourceImplementation(this.local);

  final ILocalDatabase local;
  final _searchData = SearchData();

  @override
  Future<SearchItemsModel> getItems() async {
    try {
      final result = await local.get(
          table: "searchItems",
          debugData: List.filled(10, _searchData.fakeSearchItem));

      List<SearchItemsDataModel> _data = [];
      for (var element in result) {
        SearchItemsDataModel value = SearchItemsDataModel(
          id: int.parse(element['id'].toString()),
          name: element["name"].toString(),
        );
        _data.add(value);
      }
      return SearchItemsModel(data: _data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> addItems(String params) async {
    try {
      var value = {"name": params};

      final result = await local.post(
          table: "searchItems", values: value, debugData: _searchData.index);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
