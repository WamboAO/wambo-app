import 'package:remote/remote.dart';
import 'package:wambo/modules/product/data/models/products_model.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/product/data/datasources/products_data.dart';
import 'package:wambo/modules/product/data/datasources/products_datasource.dart';

class ProductsDatasourceImplementation implements IProductsDatasource {
  ProductsDatasourceImplementation(this.client);

  final IRemote client;
  final _header = ApiHeaders();
  final _data = ProductsData();
  @override
  Future<ProductModel> getProduct(PageConfigEntity params) async{
    try {
      final json = await client.get(
        query: "",
        header: _header.setAuthHeaders(
          params.appToken,
        ),
        debugData: _data.fakeProduct,
      );
      return ProductModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

 @override
  Future<ProductsModel> getPopular(PageConfigEntity params) async {
    try {
      final json = await client.get(
          query: "",
          header: _header.setAuthHeaders(params.appToken),
          debugData: _data.fakePopular);
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
          debugData: _data.fakeProducts);
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
          debugData: _data.fakePromos);
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
          debugData: _data.fakeRecent);
      return ProductsModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductsModel> getForYou(PageConfigEntity params) async{
    try {
      final json = await client.get(
          query: "",
          header: _header.setAuthHeaders(params.appToken),
          debugData: _data.fakeForyou);
      return ProductsModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductsModel> getSuggestions(PageConfigEntity params) async{
    try {
      final json = await client.get(
          query: "",
          header: _header.setAuthHeaders(params.appToken),
          debugData: _data.fakeSuggestions);
      return ProductsModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
  
}