import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/mixins/repository_data_mixin.dart';
import 'package:wambo/modules/startup/data/datasources/authenticated_user_delete_datasource.dart';
import 'package:wambo/modules/startup/domain/repositories/authenticated_user_delete_repository.dart';

class AuthenticatedUserDeleteRepositoryImplementation
    with RepositoryDataHelper<bool>
    implements IAuthenticatedUserDeleteRepository {
  AuthenticatedUserDeleteRepositoryImplementation(this.datasource);
  final IAuthenticatedUserDeleteDatasource datasource;
  @override
  Future<Either<Failure, bool>> delete() async {
    return await requestFromRepository(datasource.delete());
  }
}
