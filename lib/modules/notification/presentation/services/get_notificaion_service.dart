// ignore_for_file: must_call_super

import 'package:wambo/app/locator.dart';
import 'package:wambo/core/interfaces/stoppable_interface.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/notification/domain/entities/notification_entity.dart';
import 'package:wambo/modules/notification/domain/usecases/get_notification_usecase.dart';
import 'package:wambo/modules/startup/presentation/services/get_authenticated_user_service.dart';
import 'package:rxdart/rxdart.dart';

class GetNotificationService extends Istoppable {
  GetNotificationService(this.usecase);
  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();
 
  final GetNotificationUsecase usecase;

  final BehaviorSubject<ApiResponse<NotificationEntity>> _response =
      BehaviorSubject<ApiResponse<NotificationEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<NotificationEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<NotificationEntity>> get dataSink => _response.sink;

  Future getNotifications() async {
    dataSink.add(ApiResponse.loading("loading.."));
   
    final result = await usecase(PageConfigEntity(
    
        appToken: _getAuthenticatedUserService.currentUser!.appToken!,
        token: _getAuthenticatedUserService.currentUser!.token!,
        ));

    ApiResponse<NotificationEntity> response =
        result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });
    
    dataSink.add(response);
   
  }

  @override
  void start() {
    if(_getAuthenticatedUserService.currentUser != null){
      getNotifications();
    }
    
  }

}
