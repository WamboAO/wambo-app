import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/categories/data/models/categories_model.dart';

abstract class IGetCategoriesDatasource {
  Future<CategoriesModel> getCategories(PageConfigEntity params);
}