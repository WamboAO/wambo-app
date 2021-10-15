import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/modules/authentication/domain/entities/authentication_user_reponse_entity.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';

class AuthenticationLoginUsecase implements Usecase<AuthenticationUserReponseEntity, UserRegistrationCredentialsEntity> {
  @override
  Future<Either<Failure, AuthenticationUserReponseEntity>> call(UserRegistrationCredentialsEntity params) {
    // TODO: implement call
    throw UnimplementedError();
  }
  
}