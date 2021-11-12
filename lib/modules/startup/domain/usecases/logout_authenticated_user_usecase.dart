import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/shared/entities/generic_entity.dart';
import 'package:wambo/modules/startup/domain/repositories/logout_authenticated_user_repository.dart';

class LogoutAuthenticatedUserUsecase
    implements Usecase<GenericEntity, NoParams> {
  LogoutAuthenticatedUserUsecase(this.repository);
  ILogoutAuthenticatedUserRepository repository;
  @override
  Future<Either<Failure, GenericEntity>> call(
      NoParams params) async {
    
    return await repository.logoutUser();
  }
}
