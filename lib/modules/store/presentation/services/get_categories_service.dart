import 'package:rxdart/rxdart.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/startup/presentation/services/get_authenticated_user_service.dart';
import 'package:wambo/modules/store/domain/entities/categories_entity.dart';
import 'package:wambo/modules/store/domain/usecases/get_categories_usecase.dart';

class GetCategoriesService  {
  GetCategoriesService(this.usecase);
  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();
 
  final GetCategoriesUsecase usecase;

  final BehaviorSubject<ApiResponse<CategoriesEntity>> _response =
      BehaviorSubject<ApiResponse<CategoriesEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<CategoriesEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<CategoriesEntity>> get dataSink => _response.sink;

  Future getCategories() async {
    
    final result = await usecase(PageConfigEntity(
        perPage: 9,
        page: 1,
        appToken: _getAuthenticatedUserService.currentUser!.appToken!,
        token: ""));

    ApiResponse<CategoriesEntity> response =
        result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });
    
    dataSink.add(response);
   
  }

  
}