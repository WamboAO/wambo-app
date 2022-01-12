import 'package:wambo/core/interfaces/remote_interface.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/shared/helpers/api_header_helpers.dart';
import 'package:wambo/modules/search/data/datasources/search_remote_datasource.dart';
import 'package:wambo/modules/search/data/models/search_items_model.dart';

class SearchRemoteDatasourceImplementation implements ISearchRemoteDatasource {
  SearchRemoteDatasourceImplementation(this.client);

   final IRemote client;
  final _header = ApiHeaders();
  @override
  Future<SearchItemsModel> search(PageConfigEntity params)async {
    try {
      final json = await client.get(
          query: "", header: _header.setHeaders(), debugType: "search_list");
      return SearchItemsModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

}