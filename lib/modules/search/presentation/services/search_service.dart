import 'package:rxdart/rxdart.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/search/domain/entities/search_items_entity.dart';
import 'package:wambo/modules/search/domain/usecases/search_usecase.dart';
import 'package:wambo/modules/startup/presentation/services/get_authenticated_user_service.dart';

class SearchService {
  SearchService(this.usecase);

  final SearchUsecase usecase;
  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();

  final BehaviorSubject<ApiResponse<SearchItemsEntity>> _response =
      BehaviorSubject<ApiResponse<SearchItemsEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<SearchItemsEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<SearchItemsEntity>> get dataSink => _response.sink;

  Future search(String search) async {
    dataSink.add(ApiResponse.loading("loading"));
    final result = await usecase(PageConfigEntity(
      search: search,
      appToken: _getAuthenticatedUserService.currentUser!.appToken!,
    ));

    ApiResponse<SearchItemsEntity> response =
        result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    dataSink.add(response);
  }
}
