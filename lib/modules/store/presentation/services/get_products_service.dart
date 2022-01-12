import 'package:rxdart/rxdart.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/core/shared/entities/products_entity.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/startup/presentation/services/get_authenticated_user_service.dart';
import 'package:wambo/modules/store/domain/usecases/get_products_usecase.dart';

class GetProductsService {
  GetProductsService(this.usecase);

  final GetProductsUsecase usecase;

  final BehaviorSubject<ApiResponse<ProductsEntity>> _response =
      BehaviorSubject<ApiResponse<ProductsEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<ProductsEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<ProductsEntity>> get dataSink => _response.sink;

  Future getProducts({required PageConfigEntity config}) async {
    final result = await usecase(config);

    ApiResponse<ProductsEntity> response =
        result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    dataSink.add(response);
  }
}

class GetPromoService {
  GetPromoService(this.usecase);

  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();
  final GetProductsUsecase usecase;

  final BehaviorSubject<ApiResponse<ProductsEntity>> _response =
      BehaviorSubject<ApiResponse<ProductsEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<ProductsEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<ProductsEntity>> get dataSink => _response.sink;

  Future getPromos() async {
    final result = await usecase(PageConfigEntity(
      perPage: 3,
      page: 1,
      productType: ProductType.promo,
      appToken: _getAuthenticatedUserService.currentUser!.appToken!,
    ));

    ApiResponse<ProductsEntity> response =
        result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    dataSink.add(response);
  }
}

class GetPopularService {
  GetPopularService(this.usecase);

  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();
  final GetProductsUsecase usecase;

  final BehaviorSubject<ApiResponse<ProductsEntity>> _response =
      BehaviorSubject<ApiResponse<ProductsEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<ProductsEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<ProductsEntity>> get dataSink => _response.sink;

  Future getPopular() async {
    final result = await usecase(PageConfigEntity(
      perPage: 2,
      page: 1,
      productType: ProductType.popular,
      appToken: _getAuthenticatedUserService.currentUser!.appToken!,
    ));

    ApiResponse<ProductsEntity> response =
        result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    dataSink.add(response);
  }
}

class GetRecentService {
  GetRecentService(this.usecase);

  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();
  final GetProductsUsecase usecase;

  final BehaviorSubject<ApiResponse<ProductsEntity>> _response =
      BehaviorSubject<ApiResponse<ProductsEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<ProductsEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<ProductsEntity>> get dataSink => _response.sink;

  Future getRecent() async {
    final result = await usecase(PageConfigEntity(
      perPage: 2,
      page: 1,
      productType: ProductType.recent,
      appToken: _getAuthenticatedUserService.currentUser!.appToken!,
    ));

    ApiResponse<ProductsEntity> response =
        result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    dataSink.add(response);
  }
}

class GetForYouService {
  GetForYouService(this.usecase);

  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();
  final GetProductsUsecase usecase;

  final BehaviorSubject<ApiResponse<ProductsEntity>> _response =
      BehaviorSubject<ApiResponse<ProductsEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<ProductsEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<ProductsEntity>> get dataSink => _response.sink;

  Future getForYou() async {
    final result = await usecase(PageConfigEntity(
      perPage: 2,
      page: 1,
      productType: ProductType.forYou,
      appToken: _getAuthenticatedUserService.currentUser!.appToken!,
    ));

    ApiResponse<ProductsEntity> response =
        result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    dataSink.add(response);
  }
}
