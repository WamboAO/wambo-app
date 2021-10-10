import 'package:wambo/core/mixins/repository_data_mixin.dart';
import 'package:wambo/features/authentication/data/datasources/authenticate_user_datasource.dart';
import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/features/authentication/domain/repositories/authenticate_user_repository.dart';

class AuthenticateUserRepositoryImplementation
    with RepositoryDataHelper<bool>
    implements IAuthenticateUserRepository {
  AuthenticateUserRepositoryImplementation(this.datasource);
  final IAuthenticateUserDatasource datasource;

  @override
  Future<Either<Failure, bool>> addAuthenticatedUserLocaly(
      AuthenticatedUserEntity userAuth) async {
    return await requestFromRepository(
        datasource.addAuthenticatedUserLocaly(userAuth));
   
  }
}
