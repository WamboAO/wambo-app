import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/shared/entities/validation_helpers.dart';
import 'package:wambo/modules/authentication/domain/entities/authentication_user_reponse_entity.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/domain/repositories/authentication_social_response_repository.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';

class AuthenticationSocialResponseUsecase
    implements
        Usecase<AuthenticationUserReponseEntity,
            UserRegistrationCredentialsEntity> {
  AuthenticationSocialResponseUsecase(this.repository);
  final IAuthenticationSocialResponseRepository repository;
  @override
  Future<Either<Failure, AuthenticationUserReponseEntity>> call(
      UserRegistrationCredentialsEntity params) async {
      final emailValidation = validateEmail(params.email);
      if (emailValidation != null) {
      return Left(emailValidation);
    }

    return await repository.access(params);
  }
}
