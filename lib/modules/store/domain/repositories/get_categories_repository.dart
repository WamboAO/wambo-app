import 'package:dartz/dartz.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/store/domain/entities/categories_entity.dart';

abstract class IGetCategoriesRepository {
  Future<Either<Failure, CategoriesEntity>> getCategories(PageConfigEntity params);
}
