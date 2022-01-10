import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/modules/store/data/datasources/categories/get_categories_datasource.dart';
import 'package:wambo/modules/store/domain/entities/categories_entity.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/modules/store/domain/repositories/get_categories_repository.dart';

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
