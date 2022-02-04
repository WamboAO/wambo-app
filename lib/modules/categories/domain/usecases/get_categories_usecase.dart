import 'package:errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:interfaces/interfaces.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/categories/domain/entities/categories_entity.dart';
import 'package:wambo/modules/categories/domain/repositories/get_categories_repository.dart';

class GetCategoriesUsecase
    implements Usecase<CategoriesEntity, PageConfigEntity> {
  GetCategoriesUsecase(this.repository);

  final IGetCategoriesRepository repository;
  @override
  Future<Either<Failure, CategoriesEntity>> call(
      PageConfigEntity params) async {
    return await repository.getCategories(params);
  }
}
