import 'package:catcher/catcher.dart';
import 'package:errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:network/network.dart';
import 'package:wambo/modules/startup/data/datasources/local/get_authenticated_user_localy_datasource.dart';
import 'package:wambo/modules/startup/data/datasources/remote/user/get_authenticated_user_remotely_datasource.dart';
import 'package:wambo/modules/authentication/data/models/authenticated_user_response_model.dart';
import 'package:wambo/modules/authentication/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/domain/entities/app_configuration_entity.dart';
import 'package:wambo/modules/startup/domain/repositories/get_authenticated_user_repository.dart';
import 'package:stack_trace/stack_trace.dart';

class GetAuthenticatedUserRepositoryImplementation
    implements IGetAuthenticatedUserRepository {
  GetAuthenticatedUserRepositoryImplementation(
      this.network, this.localyDatasource, this.remotelyDatasource);
  final INetwork network;
  final IGetAuthenticatedUserLocalyDatasource localyDatasource;
  final IGetAuthenticatedUserRemotelyDatasource remotelyDatasource;

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> getUser(
      String params) async {
    if (await network.isConnected) {
      try {
        final app = await remotelyDatasource.getAppConfig(params);
        try {
          final local = await localyDatasource.getUserLocaly();

          try {
            final remote = await remotelyDatasource.getUserRemotely(local);
            AuthenticatedUserEntity data = convert(remote: remote, app: app);
            try {
              final add = await localyDatasource.addUserLocaly(data);
              if (add == true) {
                return Right(data);
              } else {
                await localyDatasource.removeUser();
                return const Left(FetchDataFailure("Erro ao inserir dados"));
              }
            } on CachedException catch (e) {
              await localyDatasource.removeUser();
              Catcher.reportCheckedError(e, Trace.current());
              return const Left(FetchDataFailure("Erro ao inserir dados"));
            }
          } on FetchDataException catch (e) {
            await localyDatasource.removeUser();
            return Left(FetchDataFailure("$e"));
          } on BadRequestException catch (e) {
            await localyDatasource.removeUser();
            return Left(FetchDataFailure("$e"));
          } on UnauthorisedException catch (e) {
            await localyDatasource.removeUser();
            return Left(FetchDataFailure("$e"));
          } on NotFoundException catch (e) {
            await localyDatasource.removeUser();
            return Left(FetchDataFailure("$e"));
          }
        } on FetchDataException catch (e) {
          return Left(FetchDataFailure("$e"));
        } on CachedException catch (e) {
          Catcher.reportCheckedError(e, Trace.current());
          return const Left(FetchDataFailure("O que procuras não existe"));
        }
      } on FetchDataException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on BadRequestException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on UnauthorisedException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on NotFoundException catch (e) {
        return Left(FetchDataFailure("$e"));
      }
    } else {
      return const Left(FetchDataFailure("Sem conexão com a Internet"));
    }
  }

  AuthenticatedUserEntity convert(
      {required AuthenticatedUserResponseModel remote,
      required AppConfigurationEntity app}) {
    AuthenticatedUserEntity params = AuthenticatedUserEntity(
      id: remote.data != null ? remote.data!.user.id : null,
      email: remote.data != null ? remote.data!.user.email : null,
      name: remote.data != null && remote.data!.user.name != null
          ? remote.data!.user.name
          : null,
      phone: remote.data != null && remote.data!.user.phone != null
          ? remote.data!.user.phone
          : null,
      dob: remote.data != null && remote.data!.user.birthday != null
          ? remote.data!.user.birthday
          : null,
      gender: remote.data != null && remote.data!.user.gender != null
          ? remote.data!.user.gender
          : null,
      avatar: remote.data != null && remote.data!.user.avatar != null
          ? remote.data!.user.avatar
          : null,
      role: remote.data != null ? remote.data!.user.role : null,
      createdAt: remote.data != null ? remote.data!.user.createdAt : null,
      token: remote.data != null ? remote.data!.token : null,
      refreshToken: remote.data != null ? remote.data!.refreshToken : null,
      address: remote.data != null && remote.data!.user.address != null
          ? remote.data!.user.address
          : null,
      appId: app.data != null ? app.data!.appId : null,
      appToken: app.data != null ? app.data!.appToken : null,
    );
    return params;
  }
}
