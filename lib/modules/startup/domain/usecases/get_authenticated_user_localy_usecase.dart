import 'package:dartz/dartz.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/domain/repositories/authenticated_user_repository.dart';

class GetAuthenticatedUserLocaly
    implements Usecase<AuthenticatedUserEntity, NoParams> {
  GetAuthenticatedUserLocaly(this.repository);
  final IAuthenticatedUserRepository repository;

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> call(NoParams params) async {
    return await repository.getAuthenticatedUserLocaly();
  }
}
