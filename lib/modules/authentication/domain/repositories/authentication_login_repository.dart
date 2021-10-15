import 'package:dartz/dartz.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/modules/authentication/domain/entities/authentication_user_reponse_entity.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';

abstract class IAuthenticationLoginRepository {
  Future<Either<Failure, AuthenticationUserReponseEntity>> login(UserRegistrationCredentialsEntity params);
}