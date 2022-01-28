import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:wambo/modules/authentication/domain/entities/authenticated_user_entity.dart';

abstract class IGetAuthenticatedUserRepository {
  Future<Either<Failure, AuthenticatedUserEntity>> getUser(String params);
}
