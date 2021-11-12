import 'package:catcher/core/catcher.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/shared/entities/generic_entity.dart';
import 'package:wambo/core/shared/entities/authenticated_user_entity.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/modules/startup/data/datasources/remote/logout_authenticated_user_datasource.dart';
import 'package:wambo/modules/startup/domain/repositories/logout_authenticated_user_repository.dart';

class LogoutAuthenticatedUserRepositoryImplementation
    implements ILogoutAuthenticatedUserRepository {
  LogoutAuthenticatedUserRepositoryImplementation(
      this.remotelyDatasource, this.localyDatasource);

  final ILogoutAuthenticatedUserDatasource remotelyDatasource;
  final IGetAuthenticatedUserLocalyDatasource localyDatasource;
  @override
  Future<Either<Failure, GenericEntity>> logoutUser() async {
    try {
      final local = await localyDatasource.getUserLocaly();
      try {
        final result = await remotelyDatasource.logoutUser(local);
        await localyDatasource.removeUser();
        return Right(result);
      } on FetchDataException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on BadRequestException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on UnauthorisedException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on NotFoundException catch (e) {
        return Left(FetchDataFailure("$e"));
      }
    } on FetchDataException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on CachedException catch (e) {
      Catcher.reportCheckedError(e, Trace.current());
      return Left(FetchDataFailure("O que procuras não existe"));
    }
  }
}
