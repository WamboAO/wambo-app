import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/store/data/models/store_info_model.dart';

abstract class IGetStoreInfoDatasource {
  Future<StoreInfoModel> getStoreInfo(PageConfigEntity params);
}