import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/features/startup/data/datasources/authenticated_user_datasource.dart';
import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/features/startup/domain/repositories/authenticated_user_repository.dart';

class AuthenticatedUserRepositoryImplementation
    implements IAuthenticatedUserRepository {
  AuthenticatedUserRepositoryImplementation(this.datasource);
  final IAuthenticatedUserDatasource datasource;

  @override
  Future<Either<Failure, AuthenticatedUserEntity>>
      getAuthenticatedUserLocaly() async {
    try {
      final result = await datasource.getAuthenticatedUserLocaly();

      return Right(result);
    } on FetchDataException catch (e) {
      return Left(FetchDataFailure("$e"));
    }
  }
}
