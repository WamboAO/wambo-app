import 'package:wambo/modules/posters/data/datasources/get_store_info_datasource.dart';
import 'package:wambo/modules/posters/domain/entities/store_info_entity.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/modules/posters/domain/repositories/get_store_info_repository.dart';

class GetStoreInfoRepositoryImplementation implements IGetStoreInfoRepository {
  GetStoreInfoRepositoryImplementation(this.datasource);

  final IGetStoreInfoDatasource datasource;
  @override
  Future<Either<Failure, StoreInfoEntity>> getStoreInfo(
      PageConfigEntity params) async {
    try {
      final result = await datasource.getStoreInfo(params);
      return Right(result);
    } on FetchDataException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on BadRequestException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on UnauthorisedException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on NotFoundException catch (e) {
      return Left(FetchDataFailure("$e"));
    }
  }
}
