import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/shared/entities/products_entity.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/store/data/datasources/products/get_products_datasource.dart';
import 'package:wambo/modules/store/domain/repositories/get_products_repository.dart';

class GetProductsRepositoryImplementation implements IGetProductsRepository {
  GetProductsRepositoryImplementation(this.datasource);

  final IGetProductsDatasource datasource;
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
    
  } else {
     return Left(FetchDataFailure("Missing Product Type"));
  }
   } 
}
