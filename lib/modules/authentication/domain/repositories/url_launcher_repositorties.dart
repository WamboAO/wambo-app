import 'package:dartz/dartz.dart';
import 'package:wambo/core/errors/failures.dart';

abstract class IUrlLauncherRepository {
  Future<Either<Failure, void>> link(String params);
}
