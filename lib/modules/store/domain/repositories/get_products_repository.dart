import 'package:dartz/dartz.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/shared/entities/products_entity.dart';

abstract class IGetProductsRepository {
  Future<Either<Failure, ProductsEntity>> getProducts(PageConfigEntity params);
}
