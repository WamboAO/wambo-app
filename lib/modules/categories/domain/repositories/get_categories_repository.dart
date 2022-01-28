import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/categories/domain/entities/categories_entity.dart';

abstract class IGetCategoriesRepository {
  Future<Either<Failure, CategoriesEntity>> getCategories(PageConfigEntity params);
}
