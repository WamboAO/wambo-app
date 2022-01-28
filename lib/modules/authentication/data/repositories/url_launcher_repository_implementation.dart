import 'package:errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/modules/authentication/data/datasources/url_launcher_datasource.dart';
import 'package:wambo/modules/authentication/domain/repositories/url_launcher_repositorties.dart';

class UrlLauncherRepositoryImplementation implements IUrlLauncherRepository {
  UrlLauncherRepositoryImplementation(this.datasource);
  final IUrlLauncherDatasource datasource;
  @override
  Future<Either<Failure, void>> link(String params) async {
    try {
      final result = await datasource.link(params);
      return Right(result);
    } on FetchDataException catch (e) {
      return Left(FetchDataFailure("$e"));
    }
  }
}
