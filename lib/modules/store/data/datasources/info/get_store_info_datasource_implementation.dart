import 'package:wambo/core/interfaces/remote_interface.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/shared/helpers/api_header_helpers.dart';
import 'package:wambo/modules/store/data/datasources/info/get_store_info_datasource.dart';
import 'package:wambo/modules/store/data/models/store_info_model.dart';

class GetStoreInfoDatasourceImplementation implements IGetStoreInfoDatasource {
  GetStoreInfoDatasourceImplementation(this.client);

  final IRemote client;
  final _header = ApiHeaders();
  @override
  Future<StoreInfoModel> getStoreInfo(PageConfigEntity params) async {
    try {
      final json = await client.get(
        query: "",
        header: _header.setAuthHeaders(
          params.appToken,
        ),
        debugType: "get_store_info",
      );
      return StoreInfoModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
