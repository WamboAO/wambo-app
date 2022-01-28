import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/posters/domain/entities/store_info_entity.dart';

class StoreInfoViewModel extends StreamViewModel<ApiResponse<StoreInfoEntity>> {
  StoreInfoViewModel() {
    log.d('created');
  }

  final log = getLogger('StoreInfoViewModel');
  final _getStoreInfoService = locator<GetStoreInfoService>();
  bool get isError => dataReady && data!.status == Status.error;
  bool get isLoading => dataReady && data!.status == Status.loading;
  bool get isComplete => dataReady && data!.status == Status.completed;
  StoreInfoEntity? get store =>
      dataReady && data!.status == Status.completed ? data!.data! : null;
  @override
  Stream<ApiResponse<StoreInfoEntity>> get stream =>
      _getStoreInfoService.dataStream;

  int _currentIndex = 0;
  get currentIndex => _currentIndex;

  setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
