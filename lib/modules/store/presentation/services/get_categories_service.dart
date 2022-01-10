import 'package:rxdart/rxdart.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/store/domain/entities/categories_entity.dart';
import 'package:wambo/modules/store/domain/usecases/get_categories_usecase.dart';

class GetCategoriesService  {
  GetCategoriesService(this.usecase);

  final GetCategoriesUsecase usecase;

  final BehaviorSubject<ApiResponse<CategoriesEntity>> _response =
      BehaviorSubject<ApiResponse<CategoriesEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<CategoriesEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<CategoriesEntity>> get dataSink => _response.sink;

  Future getCategories({required PageConfigEntity config}) async {
    
    final result = await usecase(config);

    ApiResponse<CategoriesEntity> response =
        result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });
    
    dataSink.add(response);
   
  }

  
}