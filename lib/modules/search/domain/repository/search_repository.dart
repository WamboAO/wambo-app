import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/search/domain/entities/search_items_entity.dart';

abstract class ISearchRepository {
  Future<Either<Failure, SearchItemsEntity>> search(PageConfigEntity params);
    Future<Either<Failure, int>> addItem(String params);

}
