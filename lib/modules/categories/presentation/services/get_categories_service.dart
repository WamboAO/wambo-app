import 'package:rxdart/rxdart.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:interfaces/interfaces.dart';
import 'package:wambo/modules/startup/presentation/services/get_authenticated_user_service.dart';
import 'package:wambo/modules/categories/domain/entities/categories_entity.dart';
import 'package:wambo/modules/categories/domain/usecases/get_categories_usecase.dart';

class GetCategoriesService  {
  GetCategoriesService(this.usecase);

  final GetCategoriesUsecase usecase;
  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();
  final BehaviorSubject<ApiResponse<CategoriesEntity>> _response =
      BehaviorSubject<ApiResponse<CategoriesEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<CategoriesEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<CategoriesEntity>> get dataSink => _response.sink;

  Future getCategories(bool isRefresh) async {
      if (isRefresh == true) dataSink.add(ApiResponse.loading("loading..."));
    final result = await usecase(PageConfigEntity(
        perPage: 9,
        page: 1,
        appToken: _getAuthenticatedUserService.currentUser!.appToken!,
      ));

    ApiResponse<CategoriesEntity> response =
        result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });
    
    dataSink.add(response);
   
  }

  
}