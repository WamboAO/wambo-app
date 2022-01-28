import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/product/data/models/products_model.dart';

abstract class IProductsDatasource {
  Future<ProductsModel> getPromo(PageConfigEntity params);
  Future<ProductsModel> getPopular(PageConfigEntity params);
  Future<ProductsModel> getRecent(PageConfigEntity params);
  Future<ProductsModel> getProducts(PageConfigEntity params);
  Future<ProductsModel> getForYou(PageConfigEntity params);
  Future<ProductsModel> getSuggestions(PageConfigEntity params);
  Future<ProductModel> getProduct(PageConfigEntity params);
}
