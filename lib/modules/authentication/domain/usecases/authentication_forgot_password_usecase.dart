import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/shared/entities/generic_entity.dart';
import 'package:wambo/core/shared/entities/validation_helpers.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/domain/repositories/authentication_forgot_password_repository.dart';

class AuthenticationForgotPasswordUsecase implements Usecase<GenericEntity, UserRegistrationCredentialsEntity> {
  AuthenticationForgotPasswordUsecase(this.repository);
  final IAuthenticationForgotPasswordRepository repository;

  
  @override
  Future<Either<Failure, GenericEntity>> call(UserRegistrationCredentialsEntity params) async{
    final emailValidation = validateEmail(params.email);
    

    if (emailValidation != null) {
      return Left(emailValidation);
    }
    
    return await repository.resetPassword(params);
  }
  
}