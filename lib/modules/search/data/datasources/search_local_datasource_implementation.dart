import 'dart:convert';
import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/interfaces/local_storage_interface.dart';
import 'package:wambo/modules/search/data/datasources/search_local_datasource.dart';
import 'package:wambo/modules/search/data/models/search_items_model.dart';

class SearchLocalDatasourceImplementation implements ISearchLocalDatasource {
  SearchLocalDatasourceImplementation(this.local);

    final ILocalStorage local;

  @override
  Future<SearchItemsModel> getItems() async{
   try {
      final response = await local.get(key: "search", debugType: "search_list");
      if (response != null) {
        var data = json.decode(response);
        return SearchItemsModel.fromJson(data);
      } else {
        throw FetchDataException('Lista de pesquisa vazia');
      }
    } catch (e) {
      rethrow;
    }
  }
  
}