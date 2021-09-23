import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/features/login/data/datasources/authenticate_user_datasource.dart';
import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/features/login/domain/repositories/authenticate_user_repository.dart';

class AuthenticateUserRepositoryImplementation
    implements IAuthenticateUserRepository {
  AuthenticateUserRepositoryImplementation(this.datasource);
  final IAuthenticateUserDatasource datasource;

  @override
  Future<Either<Failure, bool>> addAuthenticatedUserLocaly(
      AuthenticatedUserEntity userAuth) async {
    try {
      final result = await datasource.addAuthenticatedUserLocaly(userAuth);
      return Right(result);
    } on FetchDataException catch (e) {
      return Left(FetchDataFailure("$e"));
    }
  }
}
