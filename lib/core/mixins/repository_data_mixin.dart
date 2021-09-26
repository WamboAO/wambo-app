import 'package:dartz/dartz.dart';
import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/errors/failures.dart';

mixin RepositoryDataHelper<T> {
  Future<Either<Failure, T>> requestFromRepository(Future<T> request) async {
    try {
      final result = await request;

      return Right(result);
    } on FetchDataException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on BadRequestException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on UnauthorisedException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on InvalidInputException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on NotFoundException catch (e) {
      return Left(FetchDataFailure("$e"));
    }
  }
}
