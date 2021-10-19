import 'package:dartz/dartz.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/modules/authentication/domain/entities/authentication_user_reponse_entity.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';

abstract class IGetRefreshTokenRepository {
  Future<Either<Failure, AuthenticationUserReponseEntity>> refreshToken(
      AuthenticatedUserEntity params);
}
