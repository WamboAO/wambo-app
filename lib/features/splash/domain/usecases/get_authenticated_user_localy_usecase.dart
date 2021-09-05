import 'package:wambo/core/base/exception_helpers.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/usecase/usecase.dart';
import 'package:wambo/features/splash/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/features/splash/domain/repositories/authenticated_user_repository.dart';

class GetAuthenticatedUserLocaly
    implements Usecase<AuthenticatedUserEntity, NoParams> {
  GetAuthenticatedUserLocaly(this.repository);
  final IAuthenticatedUserRepository repository;

  
  @override
  Future<Either<ExceptionHelper, AuthenticatedUserEntity>> call(
      NoParams params) async {
    return await repository.getAuthenticatedUserLocaly();
  }
}
