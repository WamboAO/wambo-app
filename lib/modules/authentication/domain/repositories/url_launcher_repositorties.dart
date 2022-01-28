import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
abstract class IUrlLauncherRepository {
  Future<Either<Failure, void>> link(String params);
}
