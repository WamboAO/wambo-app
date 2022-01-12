import 'package:rxdart/rxdart.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/search/domain/entities/search_items_entity.dart';
import 'package:wambo/modules/search/domain/usecases/search_usecase.dart';

class SearchService  {
  SearchService(this.usecase);

  final SearchUsecase usecase;

  final BehaviorSubject<ApiResponse<SearchItemsEntity>> _response =
      BehaviorSubject<ApiResponse<SearchItemsEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<SearchItemsEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<SearchItemsEntity>> get dataSink => _response.sink;

  Future search({required PageConfigEntity config}) async {
    
    final result = await usecase(config);

    ApiResponse<SearchItemsEntity> response =
        result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });
    
    dataSink.add(response);
   
  }

  
}