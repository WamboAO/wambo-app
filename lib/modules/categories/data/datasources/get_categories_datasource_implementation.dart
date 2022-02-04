import 'package:remote/remote.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/categories/data/datasources/categories_data.dart';
import 'package:wambo/modules/categories/data/datasources/get_categories_datasource.dart';
import 'package:wambo/modules/categories/data/models/categories_model.dart';

class GetCategoriesDatasourceImplementation implements IGetCategoriesDatasource {
  GetCategoriesDatasourceImplementation(this.client);

   final IRemote client;
  final _header = ApiHeaders();
  final _data = CategoriesData();
  @override
  Future<CategoriesModel> getCategories(PageConfigEntity params) async{
  try {
      final json = await client.get(
        query: "",
        header: _header.setAuthHeaders(
          params.appToken,
        ),
        debugData: _data.fakeCategories,
      );
      return CategoriesModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
  
}