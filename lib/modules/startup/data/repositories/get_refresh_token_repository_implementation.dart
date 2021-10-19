import 'package:wambo/core/mixins/repository_data_mixin.dart';
import 'package:wambo/modules/authentication/data/models/authentication_user_response_model.dart';
import 'package:wambo/modules/authentication/domain/entities/authentication_user_reponse_entity.dart';
import 'package:wambo/modules/startup/data/datasources/get_refresh_token_datasource.dart';
import 'package:wambo/modules/startup/data/models/authenticated_user_model.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/modules/startup/domain/repositories/get_refresh_token_repository.dart';

class GetRefreshTokenRepositoryImplementation
    with RepositoryDataHelper<AuthenticationUserResponseModel>
    implements IGetRefreshTokenRepository {
  GetRefreshTokenRepositoryImplementation(this.datasource);
  final IGetRefreshTokenDatasource datasource;
  @override
  Future<Either<Failure, AuthenticationUserReponseEntity>> refreshToken(
      AuthenticatedUserEntity params) async {
    return await requestFromRepository(datasource.refreshToken(params));
  }
}
