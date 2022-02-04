import 'package:errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:interfaces/interfaces.dart';
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
