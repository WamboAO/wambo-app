import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/domain/repositories/authentication_with_social_repository.dart';

class AuthenticationWithSocialUsecase
    implements Usecase<UserRegistrationCredentialsEntity, Social> {
  AuthenticationWithSocialUsecase(this.repository);
  final IAuthenticationWithSocialRepository repository;
  @override
  Future<Either<Failure, UserRegistrationCredentialsEntity>> call(Social params) async {
    return await repository.loginWithSocial(params);
  }
}
