import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/shared/entities/validation_helpers.dart';
import 'package:wambo/modules/authentication/domain/entities/authentication_user_reponse_entity.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/domain/repositories/get_refresh_token_repository.dart';

class GetRefreshTokenUsecase
    implements Usecase<AuthenticationUserReponseEntity, AuthenticatedUserEntity> {
  GetRefreshTokenUsecase(this.repository);
  final IGetRefreshTokenRepository repository;
  @override
  Future<Either<Failure, AuthenticationUserReponseEntity>> call(
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
    return await repository.refreshToken(params);
  }
}
