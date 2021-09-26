import 'package:dartz/dartz.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';

abstract class AuthenticationWithFacebookRepository {
  Future<Either<Failure, AuthenticatedUserEntity>> loginWithFacebook();
}
