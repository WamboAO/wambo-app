import 'package:dartz/dartz.dart';
import 'package:wambo/app/imports.dart';
import 'package:errors/errors.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/domain/entities/authenticated_user_entity.dart';


class AuthenticationRepositoryImplementation
    implements IAuthenticationRepository {
  AuthenticationRepositoryImplementation(
      this.regularDatasource);

  final IAuthenticationDatasource regularDatasource;
  @override
  Future<Either<Failure, AuthenticatedUserEntity>> access(
      UserRegistrationCredentialsEntity params) async {
    if (params.type == AccessType.login) {
      try {
        final loginResult = await regularDatasource.login(params);
        return Right(loginResult);
      } on FetchDataException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on BadRequestException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on UnauthorisedException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on NotFoundException catch (e) {
        return Left(FetchDataFailure("$e"));
      }
    } else if (params.type == AccessType.register) {
      try {
        final registerResult = await regularDatasource.register(params);
        return Right(registerResult);
      } on FetchDataException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on BadRequestException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on UnauthorisedException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on NotFoundException catch (e) {
        return Left(FetchDataFailure("$e"));
      }
    }  else if (params.type == AccessType.edit) {
      try {
        final editResult = await regularDatasource.edit(params);
        return Right(editResult);
      } on FetchDataException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on BadRequestException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on UnauthorisedException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on NotFoundException catch (e) {
        return Left(FetchDataFailure("$e"));
      }
    } else if (params.type == AccessType.reset) {
      try {
        final resetResult = await regularDatasource.passwordReset(params);
        return Right(resetResult);
      } on FetchDataException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on BadRequestException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on UnauthorisedException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on NotFoundException catch (e) {
        return Left(FetchDataFailure("$e"));
      }
    } else {
      return const Left(FetchDataFailure("Missing access Type"));
    }
  }
}
