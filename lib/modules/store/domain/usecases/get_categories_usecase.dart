import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/store/domain/entities/categories_entity.dart';
import 'package:wambo/modules/store/domain/repositories/get_categories_repository.dart';

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
