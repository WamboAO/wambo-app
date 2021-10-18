import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/shared/entities/validation_helpers.dart';
import 'package:wambo/modules/authentication/domain/entities/authentication_user_reponse_entity.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/domain/repositories/authentication_register_repository.dart';

class AuthenticationRegisterUsecase
    implements
        Usecase<AuthenticationUserReponseEntity,
            UserRegistrationCredentialsEntity> {
  AuthenticationRegisterUsecase(this.repository);
  final IAuthenticationRegisterRepository repository;

  @override
  Future<Either<Failure, AuthenticationUserReponseEntity>> call(
      UserRegistrationCredentialsEntity params) async {
      
    
    final emailValidation = validateEmail(params.email);
    final passwordValidation = validatePass(params.password);
     final phoneValidation = validatePhone(params.phone);
    final fNameValidation = validateValue(params.firstName, "Primeiro nome");
    final flastValidation = validateValue(params.lastName, "Último nome");
   
    
    if (emailValidation != null) {
      return Left(emailValidation);
    }
    if (passwordValidation != null) {
      return Left(passwordValidation);
    }
    if (phoneValidation != null) {
      return Left(phoneValidation);
    }
    
    if (fNameValidation != null) {
      return Left(fNameValidation);
    }
    if (flastValidation != null) {
      return Left(flastValidation);
    }
    return await repository.signup(params);
  }
}
