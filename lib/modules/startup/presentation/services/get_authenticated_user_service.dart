// ignore_for_file: must_call_super

import 'package:rxdart/rxdart.dart';
import 'package:wambo/core/interfaces/stoppable_interface.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/core/shared/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/domain/usecases/get_authenticated_user_usecase.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetAuthenticatedUserService extends Istoppable {
  GetAuthenticatedUserService(this.usecase) {
    log.d("created");
  }
  final log = getLogger('GetAuthenticatedUserService');
  final GetAuthenticatedUserUsecase usecase;

  final BehaviorSubject<ApiResponse<AuthenticatedUserEntity>> _response =
      BehaviorSubject<ApiResponse<AuthenticatedUserEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<AuthenticatedUserEntity>> get dataStream =>
      _response.stream;

  Sink<ApiResponse<AuthenticatedUserEntity>> get dataSink => _response.sink;
  AuthenticatedUserEntity? get currentUser => _response.hasValue && _response.value.data !=null? _response.value.data: null;
  Future getUser() async {
    final result = await usecase(dotenv.env['APPID']!);

    ApiResponse<AuthenticatedUserEntity> response =
        result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });
    log.w(response);
    dataSink.add(response);
  }

  @override
  void start() {
    getUser();
  }
}
