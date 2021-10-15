import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/mixins/repository_data_mixin.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/authentication/data/datasources/authentication_with_social_datasource.dart';
import 'package:wambo/modules/authentication/data/models/user_registration_credentials_model.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/modules/authentication/domain/repositories/authentication_with_social_repository.dart';

class AuthenticationWithSocialRepositoryImplementation
    with RepositoryDataHelper<UserRegistrationCredentialsModel>
    implements IAuthenticationWithSocialRepository {
  AuthenticationWithSocialRepositoryImplementation(this.datasource);
  final IAuthenticationWithSocialDatasource datasource;
  @override
  Future<Either<Failure, UserRegistrationCredentialsEntity>>
      loginWithSocial(Social params) async {
    return await requestFromRepository(datasource.loginWithSocial(params));
  }
}
