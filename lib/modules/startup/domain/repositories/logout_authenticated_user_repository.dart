import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:wambo/core/shared/entities/generic_entity.dart';

abstract class ILogoutAuthenticatedUserRepository {
  Future<Either<Failure, GenericEntity>> logoutUser();
}