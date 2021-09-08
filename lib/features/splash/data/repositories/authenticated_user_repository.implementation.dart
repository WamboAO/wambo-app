import 'dart:io';

import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/core/base/network_data_helper.dart';
import 'package:wambo/features/splash/data/datasources/authenticated_user_datasource.dart';
import 'package:wambo/features/splash/data/models/authenticated_user_model.dart';
import 'package:wambo/features/splash/domain/entities/authenticated_user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/features/splash/domain/repositories/authenticated_user_repository.dart';

class AuthenticatedUserRepositoryImplementation
    with NetworkDataHelper<AuthenticatedUserModel>
    implements IAuthenticatedUserRepository {
  AuthenticatedUserRepositoryImplementation(this.datasource);
  final IAuthenticatedUserDatasource datasource;

  @override
  Future<Either<Failure, AuthenticatedUserEntity>>
      getAuthenticatedUserLocaly() async {
    try {
      final result =
          await requestFromDataSource(datasource.getAuthenticatedUserLocaly());

      return Right(result);
    } on FetchDataException catch (e) {
      return Left(FetchDataFailure("$e"));
    }
  }
}
