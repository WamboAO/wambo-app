import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:wambo/modules/authentication/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';

abstract class IAuthenticationRepository {
  Future<Either<Failure, AuthenticatedUserEntity>> access(
      UserRegistrationCredentialsEntity params);
  
}
