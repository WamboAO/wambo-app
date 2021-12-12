import 'package:wambo/core/interfaces/remote_interface.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/shared/helpers/api_header_helpers.dart';
import 'package:wambo/modules/store/data/datasources/get_categories_datasource.dart';
import 'package:wambo/modules/store/data/models/categories_model.dart';

class GetCategoriesDatasourceImplementation implements IGetCategoriesDatasource {
  GetCategoriesDatasourceImplementation(this.client);

   final IRemote client;
  final _header = ApiHeaders();
  @override
  Future<CategoriesModel> getCategories(PageConfigEntity params) async{
  try {
      final json = await client.get(
        query: "",
        header: _header.setAuthHeaders(
          params.appToken,
        ),
        debugType: "get_categories",
      );
      return CategoriesModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
  
}