import 'package:dartz/dartz.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/features/authentication/domain/entities/user_registration_crendentials_entities.dart';

abstract class IAuthenticationWithSocialRepository {
  Future<Either<Failure, UserRegistrationCredentialsEntity>> loginWithSocial(Social params);
}
