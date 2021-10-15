import 'package:wambo/core/mixins/repository_data_mixin.dart';
import 'package:wambo/modules/authentication/data/datasources/authentication_register_datasource.dart';
import 'package:wambo/modules/authentication/data/models/authentication_user_response_model.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/domain/entities/authentication_user_reponse_entity.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/modules/authentication/domain/repositories/authentication_register_repository.dart';

class AuthenticationRegisterRepositoryImplementation
    with RepositoryDataHelper<AuthenticationUserResponseModel>
    implements IAuthenticationRegisterRepository {
       AuthenticationRegisterRepositoryImplementation(this.datasource);
  final IAuthenticationRegisterDatasource datasource;
  @override
  Future<Either<Failure, AuthenticationUserReponseEntity>> signup(UserRegistrationCredentialsEntity params) async{
   return await requestFromRepository(datasource.signup(params));
  }
 
 
}
