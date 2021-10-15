import 'package:rxdart/rxdart.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/domain/usecases/get_authenticated_user_localy_usecase.dart';

class StartupService {
  StartupService(this.usecase);

  final GetAuthenticatedUserLocaly usecase;
  ApiResponse<AuthenticatedUserEntity> response =
      ApiResponse.loading("loading...");

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  final BehaviorSubject<ApiResponse<AuthenticatedUserEntity>> _response =
      BehaviorSubject<ApiResponse<AuthenticatedUserEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<AuthenticatedUserEntity>> get currentUser =>
      _response.stream;

  Future getAuthenticatedUserLocaly() async {
    final result = await usecase(NoParams());

    response = result.fold((l) => ApiResponse.error('$l'), (r) {
      _isLoggedIn = r.token.isNotEmpty;

      return ApiResponse.completed(r);
    });

    _response.sink.add(response);
  }
}
