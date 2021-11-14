// ignore_for_file: must_call_super

import 'package:rxdart/rxdart.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/core/interfaces/stoppable_interface.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/startup/presentation/services/get_authenticated_user_service.dart';
import 'package:wambo/modules/store/domain/entities/store_info_entity.dart';
import 'package:wambo/modules/store/domain/usecases/get_store_info_usecase.dart';

class GetStoreInfoService extends Istoppable {
  GetStoreInfoService(this.usecase);
  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();
  final GetStoreInfoUsecase usecase;

  final BehaviorSubject<ApiResponse<StoreInfoEntity>> _response =
      BehaviorSubject<ApiResponse<StoreInfoEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<StoreInfoEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<StoreInfoEntity>> get dataSink => _response.sink;

  Future getStoreInfo() async {
    final result = await usecase(PageConfigEntity(
        perPage: 0,
        page: 0,
        appToken: _getAuthenticatedUserService.currentUser!.appToken!,
        token: ""));

    ApiResponse<StoreInfoEntity> response =
        result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    dataSink.add(response);
  }

  @override
  void start() {
    getStoreInfo();
  }
}
