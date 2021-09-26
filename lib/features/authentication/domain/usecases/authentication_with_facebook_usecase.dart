import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/features/authentication/domain/repositories/authentication_with_facebook_repository.dart';
import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';

class AuthenticationWithFacebookUsecase
    implements Usecase<AuthenticatedUserEntity, NoParams> {
  AuthenticationWithFacebookUsecase(this.repository);
  final AuthenticationWithFacebookRepository repository;
  @override
  Future<Either<Failure, AuthenticatedUserEntity>> call(NoParams params) async {
    return await repository.loginWithFacebook();
  }
}
