import 'package:wambo/app/imports.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/shared/entities/authenticated_user_entity.dart';
import 'package:wambo/core/shared/entities/validation_helpers.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';

class AuthenticationUsecase
    implements
        Usecase<AuthenticatedUserEntity, UserRegistrationCredentialsEntity> {
  AuthenticationUsecase(this.repository);

  final IAuthenticationRepository repository;
  @override
  Future<Either<Failure, AuthenticatedUserEntity>> call(
      UserRegistrationCredentialsEntity params) async {
    if (params.type == AccessType.login) {
      final emailValidation = validateEmail(params.email);
      final passwordValidation = validatePass(params.password);

      if (emailValidation != null) {
        return Left(emailValidation);
      }
      if (passwordValidation != null) {
        return Left(passwordValidation);
      }
    }
    else if (params.type == AccessType.register) {
      final emailValidation = validateEmail(params.email);
      final passwordValidation = validatePass(params.password);
      final phoneValidation = validatePhone(params.phone);
      final nameValidation = validateValue(params.name, "Nome");

      if (emailValidation != null) {
        return Left(emailValidation);
      }
      if (passwordValidation != null) {
        return Left(passwordValidation);
      }
      if (phoneValidation != null) {
        return Left(phoneValidation);
      }

      if (nameValidation != null) {
        return Left(nameValidation);
      }
    }
  
    else if(params.type == AccessType.reset){
       final passwordValidation = validatePass(params.password);
       if (passwordValidation != null) {
        return Left(passwordValidation);
      }
    }

    return await repository.access(params);
  }
}
