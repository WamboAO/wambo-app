import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/search/data/models/search_items_model.dart';

abstract class ISearchRemoteDatasource {
  Future<SearchItemsModel> search(PageConfigEntity params);
}
