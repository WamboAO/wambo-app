import 'package:errors/errors.dart';
import 'package:wambo/modules/product/domain/entities/products_entity.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/product/data/datasources/products_datasource.dart';
import 'package:wambo/modules/product/domain/repositories/products_repository.dart';

class ProductsRepositoryImplementation implements IProductsRepository {
  ProductsRepositoryImplementation(this.datasource);

  final IProductsDatasource datasource;
 @override
  Future<Either<Failure, ProductsEntity>> getProducts(PageConfigEntity params) async{
   if(params.productType == ProductType.promo){
     try {
      final result = await datasource.getPromo(params);
      return Right(result);
    } on FetchDataException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on BadRequestException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on UnauthorisedException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on NotFoundException catch (e) {
      return Left(FetchDataFailure("$e"));
    }
  } else if(params.productType == ProductType.popular){
    try {
      final result = await datasource.getPopular(params);
      return Right(result);
    } on FetchDataException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on BadRequestException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on UnauthorisedException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on NotFoundException catch (e) {
      return Left(FetchDataFailure("$e"));
    }

  }else if(params.productType == ProductType.recent){
    try {
      final result = await datasource.getRecent(params);
      return Right(result);
    } on FetchDataException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on BadRequestException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on UnauthorisedException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on NotFoundException catch (e) {
      return Left(FetchDataFailure("$e"));
    }

  }else if(params.productType == ProductType.all){
    try {
      final result = await datasource.getProducts(params);
      return Right(result);
    } on FetchDataException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on BadRequestException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on UnauthorisedException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on NotFoundException catch (e) {
      return Left(FetchDataFailure("$e"));
    }
    
  } else if(params.productType == ProductType.forYou){
    try {
      final result = await datasource.getForYou(params);
      return Right(result);
    } on FetchDataException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on BadRequestException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on UnauthorisedException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on NotFoundException catch (e) {
      return Left(FetchDataFailure("$e"));
    }
    
  }else if(params.productType == ProductType.suggestions){
    try {
      final result = await datasource.getSuggestions(params);
      return Right(result);
    } on FetchDataException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on BadRequestException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on UnauthorisedException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on NotFoundException catch (e) {
      return Left(FetchDataFailure("$e"));
    }
    
  }else {
     return const Left(FetchDataFailure("Missing Product Type"));
  }
   } 

  @override
  Future<Either<Failure, ProductEntity>> getProduct(
      PageConfigEntity params) async {
     try {
      final result = await datasource.getProduct(params);
      ProductEntity products =
          ProductEntity(message: result.message, data: result.data);
      return Right(products);
    } on FetchDataException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on BadRequestException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on UnauthorisedException catch (e) {
      return Left(FetchDataFailure("$e"));
    } on NotFoundException catch (e) {
      return Left(FetchDataFailure("$e"));
    }
  }
}
