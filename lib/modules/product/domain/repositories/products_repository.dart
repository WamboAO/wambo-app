import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/modules/product/domain/entities/products_entity.dart';

abstract class IProductsRepository {
  Future<Either<Failure, ProductsEntity>> getProducts(PageConfigEntity params);
  Future<Either<Failure, ProductEntity>> getProduct(PageConfigEntity params);
}
