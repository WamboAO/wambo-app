import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/shared/entities/generic_entity.dart';
import 'package:wambo/core/shared/entities/validation_helpers.dart';
import 'package:wambo/modules/startup/domain/repositories/authentication_logout_repository.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';

class AuthenticationLogoutUsecase
    implements Usecase<GenericEntity, AuthenticatedUserEntity> {
  AuthenticationLogoutUsecase(this.repository);
  final IAuthenticationLogoutRepository repository;
  @override
  Future<Either<Failure, GenericEntity>> call(
      AuthenticatedUserEntity params) async {
    final tokenValidation = validateValue(params.token, "");
    final refreshValidation = validateValue(params.refreshToken, "");
    final appTokenValidation = validateValue(params.appToken, "");

    if (tokenValidation != null) {
      return Left(tokenValidation);
    }
    if (refreshValidation != null) {
      return Left(refreshValidation);
    }
    if (appTokenValidation != null) {
      return Left(appTokenValidation);
    }
    return await repository.logout(params);
  }
}
