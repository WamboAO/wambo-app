import 'package:remote/remote.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/shared/helpers/api_header_helpers.dart';
import 'package:wambo/modules/posters/data/datasources/get_store_info_datasource.dart';
import 'package:wambo/modules/posters/data/datasources/store_info_data.dart';
import 'package:wambo/modules/posters/data/models/store_info_model.dart';

class GetStoreInfoDatasourceImplementation implements IGetStoreInfoDatasource {
  GetStoreInfoDatasourceImplementation(this.client);

  final IRemote client;
  final _header = ApiHeaders();
  final _data = StoreInfoData();
  @override
  Future<StoreInfoModel> getStoreInfo(PageConfigEntity params) async {
    try {
      final json = await client.get(
        query: "",
        header: _header.setAuthHeaders(
          params.appToken,
        ),
        debugData: _data.fakeStoreInfo,
      );
      return StoreInfoModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
