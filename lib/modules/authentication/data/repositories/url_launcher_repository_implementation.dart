import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/mixins/repository_data_mixin.dart';
import 'package:wambo/modules/authentication/data/datasources/url_launcher_datasource.dart';
import 'package:wambo/modules/authentication/domain/repositories/url_launcher_repositorties.dart';

class UrlLauncherRepositoryImplementation
    with RepositoryDataHelper<void>
    implements IUrlLauncherRepository {
  UrlLauncherRepositoryImplementation(this.datasource);
  final IUrlLauncherDatasource datasource;
  @override
  Future<Either<Failure, void>> link(String params) async {
    return await requestFromRepository(datasource.link(params));
  }
}
