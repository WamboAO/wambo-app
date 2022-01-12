import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/search/domain/entities/search_items_entity.dart';
import 'package:wambo/modules/search/domain/repository/search_repository.dart';

class SearchUsecase implements Usecase<SearchItemsEntity, PageConfigEntity> {
  SearchUsecase(this.repository);

  final ISearchRepository repository;
  @override
  Future<Either<Failure, SearchItemsEntity>> call(
      PageConfigEntity params) async {
    return await repository.search(params);
  }
}
