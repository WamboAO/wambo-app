import 'package:wambo/core/interfaces/remote_interface.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/shared/helpers/api_header_helpers.dart';
import 'package:wambo/core/shared/models/products_model.dart';
import 'package:wambo/modules/store/data/datasources/products/get_products_datasource.dart';

class GetProductsDatasourceImplementation implements IGetProductsDatasource {
  GetProductsDatasourceImplementation(this.client);

  final IRemote client;
  final _header = ApiHeaders();

  @override
  Future<ProductsModel> getPopular(PageConfigEntity params) async {
    try {
      final json = await client.get(
          query: "",
          header: _header.setAuthHeaders(params.appToken),
          debugType: "get_products");
      return ProductsModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductsModel> getProducts(PageConfigEntity params) async {
    try {
      final json = await client.get(
          query: "",
          header: _header.setAuthHeaders(params.appToken),
          debugType: "get_products");
      return ProductsModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductsModel> getPromo(PageConfigEntity params) async {
   try {
      final json = await client.get(
          query: "",
          header: _header.setAuthHeaders(params.appToken),
          debugType: "get_promo");
      return ProductsModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductsModel> getRecent(PageConfigEntity params) async {
    try {
      final json = await client.get(
          query: "",
          header: _header.setAuthHeaders(params.appToken),
          debugType: "get_products");
      return ProductsModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
