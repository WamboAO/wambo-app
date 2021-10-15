import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/mixins/repository_data_mixin.dart';
import 'package:wambo/modules/authentication/data/datasources/authentication_login_datasource.dart';
import 'package:wambo/modules/authentication/data/models/authentication_user_response_model.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/domain/entities/authentication_user_reponse_entity.dart';
import 'package:wambo/modules/authentication/domain/repositories/authentication_login_repository.dart';

class AuthenticationLoginRepositoryImplementation
    with RepositoryDataHelper<AuthenticationUserResponseModel>
    implements IAuthenticationLoginRepository {
    AuthenticationLoginRepositoryImplementation(this.datasource);
  final IAuthenticationLoginDatasource datasource;

  
  @override
  Future<Either<Failure, AuthenticationUserReponseEntity>> login(
      UserRegistrationCredentialsEntity params) async{
    return await requestFromRepository(datasource.login(params));
  }
}
