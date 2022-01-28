import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/posters/domain/entities/store_info_entity.dart';

abstract class IGetStoreInfoRepository {
  Future<Either<Failure, StoreInfoEntity>> getStoreInfo(PageConfigEntity params);
}
