
import 'package:wambo/modules/categories/data/datasources/get_categories_datasource.dart';
import 'package:wambo/modules/categories/domain/entities/categories_entity.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/modules/categories/domain/repositories/get_categories_repository.dart';

class GetCategoriesRepositoryImplementation
    implements IGetCategoriesRepository {
  GetCategoriesRepositoryImplementation(this.datasource);

  final IGetCategoriesDatasource datasource;
  @override
  Future<Either<Failure, CategoriesEntity>> getCategories(
      PageConfigEntity params) async {
    try {
      final result = await datasource.getCategories(params);
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
