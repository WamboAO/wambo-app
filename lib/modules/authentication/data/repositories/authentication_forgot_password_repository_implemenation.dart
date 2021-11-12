import 'package:dartz/dartz.dart';
import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/core/shared/entities/generic_entity.dart';
import 'package:wambo/modules/authentication/data/datasources/authentication_forgot_password_datasource.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/domain/repositories/authentication_forgot_password_repository.dart';

class AuthenticationForgotPasswordRepositoryImplementation
    implements IAuthenticationForgotPasswordRepository {
  AuthenticationForgotPasswordRepositoryImplementation(this.datasource);
  final IAuthenticationForgotPasswordDatasource datasource;

  @override
  Future<Either<Failure, GenericEntity>> resetPassword(
      UserRegistrationCredentialsEntity params) async {
    try {
      final result = await datasource.resetPassword(params);
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
  }
}
