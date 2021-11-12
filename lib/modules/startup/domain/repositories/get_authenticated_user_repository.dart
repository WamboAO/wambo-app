import 'package:dartz/dartz.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/core/shared/entities/authenticated_user_entity.dart';

abstract class IGetAuthenticatedUserRepository {
  Future<Either<Failure, AuthenticatedUserEntity>> getUser(String params);
}
