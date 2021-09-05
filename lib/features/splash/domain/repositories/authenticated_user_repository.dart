import 'package:dartz/dartz.dart';
import 'package:wambo/core/base/exception_helpers.dart';
import 'package:wambo/features/splash/domain/entities/authenticated_user_entity.dart';

abstract class IAuthenticatedUserRepository {
  Future<Either<ExceptionHelper, AuthenticatedUserEntity>>
      getAuthenticatedUserLocaly();
}
