import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/shared/entities/products_entity.dart';
import 'package:wambo/modules/store/domain/repositories/get_products_repository.dart';

class GetProductsUsecase
    implements Usecase<ProductsEntity, PageConfigEntity> {
  GetProductsUsecase(this.repository);

  final IGetProductsRepository repository;

  @override
  Future<Either<Failure, ProductsEntity>> call(
      PageConfigEntity params) async {
    return await repository.getProducts(params);
  }
}
