import 'package:dartz/dartz.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/core/shared/entities/generic_entity.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';

abstract class IAuthenticationLogoutRepository {
  Future<Either<Failure, GenericEntity>> logout(AuthenticatedUserEntity params);
}
