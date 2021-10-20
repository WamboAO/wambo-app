import 'package:dartz/dartz.dart';
import 'package:wambo/core/errors/failures.dart';

abstract class IAuthenticatedUserDeleteRepository {
  Future<Either<Failure, bool>> delete();
}