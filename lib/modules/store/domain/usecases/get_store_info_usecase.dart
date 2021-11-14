import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/shared/entities/validation_helpers.dart';
import 'package:wambo/modules/store/domain/entities/store_info_entity.dart';
import 'package:wambo/modules/store/domain/repositories/get_store_info_repository.dart';

class GetStoreInfoUsecase
    implements Usecase<StoreInfoEntity, PageConfigEntity> {
  GetStoreInfoUsecase(this.repository);

  final IGetStoreInfoRepository repository;
  @override
  Future<Either<Failure, StoreInfoEntity>> call(PageConfigEntity params) async {
    var tokenValidation = validateValue(params.appToken, "Token");
    if (tokenValidation != null) {
      return Left(tokenValidation);
    }
    return await repository.getStoreInfo(params);
  }
}
