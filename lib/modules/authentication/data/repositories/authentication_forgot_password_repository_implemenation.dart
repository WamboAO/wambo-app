
import 'package:dartz/dartz.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/core/mixins/repository_data_mixin.dart';
import 'package:wambo/core/shared/entities/generic_entity.dart';
import 'package:wambo/modules/authentication/data/datasources/authentication_forgot_password_datasource.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/domain/repositories/authentication_forgot_password_repository.dart';

class AuthenticationForgotPasswordRepositoryImplementation
    with RepositoryDataHelper<GenericModel>
    implements IAuthenticationForgotPasswordRepository {
    AuthenticationForgotPasswordRepositoryImplementation(this.datasource);
  final IAuthenticationForgotPasswordDatasource datasource;

  @override
  Future<Either<Failure, GenericEntity>> resetPassword(UserRegistrationCredentialsEntity params) async{
    return await requestFromRepository(datasource.resetPassword(params));
  }

  
  
}