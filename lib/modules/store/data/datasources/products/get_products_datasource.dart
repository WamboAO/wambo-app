import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/shared/models/products_model.dart';

abstract class IGetProductsDatasource {
  Future<ProductsModel> getPromo(PageConfigEntity params);
  Future<ProductsModel> getPopular(PageConfigEntity params);
  Future<ProductsModel> getRecent(PageConfigEntity params);
  Future<ProductsModel> getProducts(PageConfigEntity params);
}