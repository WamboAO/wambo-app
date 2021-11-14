import 'package:dartz/dartz.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/store/domain/entities/store_info_entity.dart';

abstract class IGetStoreInfoRepository {
  Future<Either<Failure, StoreInfoEntity>> getStoreInfo(PageConfigEntity params);
}
