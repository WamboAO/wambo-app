import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/shared/entities/validation_helpers.dart';
import 'package:wambo/modules/authentication/domain/entities/authentication_user_reponse_entity.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/domain/repositories/authentication_login_repository.dart';

class AuthenticationLoginUsecase
    implements
        Usecase<AuthenticationUserReponseEntity,
            UserRegistrationCredentialsEntity> {
  AuthenticationLoginUsecase(this.repository);
  final IAuthenticationLoginRepository repository;
  @override
  Future<Either<Failure, AuthenticationUserReponseEntity>> call(
      UserRegistrationCredentialsEntity params) async {
    final emailValidation = validateEmail(params.email);
    final passwordValidation = validatePass(params.password);

    if (emailValidation != null) {
      return Left(emailValidation);
    }
    if (passwordValidation != null) {
      return Left(passwordValidation);
    }
    return await repository.login(params);
  }
}
