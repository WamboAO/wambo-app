import 'package:dartz/dartz.dart';

import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/features/startup/domain/entities/generic_entity.dart';

abstract class IAuthenticateUserRepository {
  Future<Either<Failure, GenericEntity>> addAuthenticatedUserLocaly(
      AuthenticatedUserEntity userAuth);
}
