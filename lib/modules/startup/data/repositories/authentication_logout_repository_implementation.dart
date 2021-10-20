import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/mixins/repository_data_mixin.dart';
import 'package:wambo/core/shared/entities/generic_entity.dart';
import 'package:wambo/modules/startup/data/datasources/authentication_logout_datasource.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/domain/repositories/authentication_logout_repository.dart';

class AuthenticationLogoutRepositoryImplementation
    with RepositoryDataHelper<GenericModel>
    implements IAuthenticationLogoutRepository {
  AuthenticationLogoutRepositoryImplementation(this.datasource);
  final IAuthenticationLogoutDatasource datasource;
  @override
  Future<Either<Failure, GenericEntity>> logout(
      AuthenticatedUserEntity params) async {
    return await requestFromRepository(datasource.logout(params));
  }
}
