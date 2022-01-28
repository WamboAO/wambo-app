import 'package:catcher/catcher.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:errors/errors.dart';
import 'package:wambo/modules/search/data/datasources/local/search_local_datasource.dart';
import 'package:wambo/modules/search/data/datasources/remote/search_remote_datasource.dart';
import 'package:wambo/modules/search/domain/entities/search_items_entity.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/modules/search/domain/repository/search_repository.dart';

class SearchRepositoryImplementation implements ISearchRepository {
  SearchRepositoryImplementation(this.localDatasource, this.remoteDatasource);

  final ISearchLocalDatasource localDatasource;
  final ISearchRemoteDatasource remoteDatasource;
  @override
  Future<Either<Failure, SearchItemsEntity>> search(
      PageConfigEntity params) async {
    if (params.search != null && params.search!.isNotEmpty) {
      try {
        final remote = await remoteDatasource.search(params);

        SearchItemsEntity data = SearchItemsEntity(data: remote.data);
        return Right(data);
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
      try {
        final local = await localDatasource.getItems();
        SearchItemsEntity data = SearchItemsEntity(data: local.data);

        return Right(data);
      } on FetchDataException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on CachedException catch (e) {
        Catcher.reportCheckedError(e, Trace.current());
        return const Left(FetchDataFailure("Lista de pesquisa vazia"));
      }
    }
  }

  @override
  Future<Either<Failure, int>> addItem(String params) async {
    try {
      final local = await localDatasource.addItems(params);
      return Right(local);
    } on FetchDataException catch (e) {
        return Left(FetchDataFailure("$e"));
      } on CachedException catch (e) {
        Catcher.reportCheckedError(e, Trace.current());
        return const Left(FetchDataFailure("Lista de pesquisa vazia"));
      }
  }
}
