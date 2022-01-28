import 'package:errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/product/domain/entities/products_entity.dart';
import 'package:wambo/modules/product/domain/repositories/products_repository.dart';

class ProductsUsecase implements Usecase<ProductsEntity, PageConfigEntity> {
  ProductsUsecase(this.repository);

  final IProductsRepository repository;
  @override
  Future<Either<Failure, ProductsEntity>> call(PageConfigEntity params) async {
    return await repository.getProducts(params);
  }
}

class ProductUsecase implements Usecase<ProductEntity, PageConfigEntity> {
  ProductUsecase(this.repository);

  final IProductsRepository repository;
  @override
  Future<Either<Failure, ProductEntity>> call(PageConfigEntity params) async {
    return await repository.getProduct(params);
  }
}
