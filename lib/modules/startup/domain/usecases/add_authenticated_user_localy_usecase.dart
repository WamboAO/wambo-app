import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/domain/repositories/authenticate_user_repository.dart';

class AddAuthenticatedUserLocaly
    implements Usecase<bool, AuthenticatedUserEntity> {
  AddAuthenticatedUserLocaly(this.repository);
  final IAuthenticateUserRepository repository;

  @override
  Future<Either<Failure, bool>> call(
      AuthenticatedUserEntity params) async {
    return await repository.addAuthenticatedUserLocaly(params);
  }
}
