import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/mixin/network_data_mixin.dart';
import 'package:wambo/features/startup/data/datasources/authenticate_user_datasource.dart';
import 'package:wambo/features/startup/data/models/generic_model.dart';
import 'package:wambo/features/startup/domain/entities/generic_entity.dart';
import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/features/startup/domain/repositories/authenticate_user_repository.dart';

class AuthenticateUserRepositoryImplementation
    with NetworkDataHelper<GenericModel>
    implements IAuthenticateUserRepository {
  AuthenticateUserRepositoryImplementation(this.datasource);
  final IAuthenticateUserDatasource datasource;

  @override
  Future<Either<Failure, GenericEntity>> addAuthenticatedUserLocaly(
      AuthenticatedUserEntity userAuth) async {
    try {
      final result = await requestFromDataSource(
          datasource.addAuthenticatedUserLocaly(userAuth));
      return Right(result);
    } on FetchDataException catch (e) {
      return Left(FetchDataFailure("$e"));
    }
  }
}
