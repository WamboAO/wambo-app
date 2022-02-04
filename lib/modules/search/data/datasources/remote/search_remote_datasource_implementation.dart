import 'package:remote/remote.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/search/data/datasources/remote/search_remote_datasource.dart';
import 'package:wambo/modules/search/data/datasources/search_data.dart';
import 'package:wambo/modules/search/data/models/search_items_model.dart';

class SearchRemoteDatasourceImplementation implements ISearchRemoteDatasource {
  SearchRemoteDatasourceImplementation(this.client);

  final IRemote client;
  final _header = ApiHeaders();
  final _data = SearchData();
  @override
  Future<SearchItemsModel> search(PageConfigEntity params) async {
    try {
      final json = await client.get(
          query: "",
          header: _header.setHeaders(),
          debugData: _data.fakeSearchList);
      return SearchItemsModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
