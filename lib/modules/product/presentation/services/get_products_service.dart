import 'package:rxdart/rxdart.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/core/shared/entities/page_config_entity.dart';
import 'package:interfaces/interfaces.dart';
import 'package:wambo/modules/product/domain/entities/products_entity.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/product/domain/usecases/products_usecases.dart';
import 'package:wambo/modules/startup/presentation/services/get_authenticated_user_service.dart';

class ProductService {
  ProductService(this.usecase);

  final ProductUsecase usecase;
  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();
  ApiResponse<ProductEntity> _response = ApiResponse.loading("loading...");

  Future<ApiResponse<ProductEntity>> getProduct({required int id}) async {
    _response = ApiResponse.loading("loading...");

    final result = await usecase(PageConfigEntity(
      id: id,
      appToken: _getAuthenticatedUserService.currentUser!.appToken!,
    ));

    _response = result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    return _response;
  }
}

class ProductsService {
  ProductsService(this.usecase);

  final ProductsUsecase usecase;
  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();
  final BehaviorSubject<ApiResponse<ProductsEntity>> _response =
      BehaviorSubject<ApiResponse<ProductsEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<ProductsEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<ProductsEntity>> get dataSink => _response.sink;

  Future getProducts(bool isRefresh, {int? page}) async {
    if (isRefresh == true) dataSink.add(ApiResponse.loading("loading..."));
    final result = await usecase(PageConfigEntity(
      perPage: 20,
      page: page ?? 1,
      productType: ProductType.all,
      appToken: _getAuthenticatedUserService.currentUser!.appToken!,
    ));

    ApiResponse<ProductsEntity> response =
        result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    if (isRefresh == true) {
      dataSink.add(response);
    } else {
      for (var item in response.data!.data) {
        _response.value.data!.data.add(item);
      }
    }
  }

  
}

class GetPromoService {
  GetPromoService(this.usecase);

  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();
  final ProductsUsecase usecase;

  final BehaviorSubject<ApiResponse<ProductsEntity>> _response =
      BehaviorSubject<ApiResponse<ProductsEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<ProductsEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<ProductsEntity>> get dataSink => _response.sink;

  Future getPromos(bool isRefresh) async {
    if (isRefresh == true) dataSink.add(ApiResponse.loading("loading..."));
    final result = await usecase(PageConfigEntity(
      perPage: 2,
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
  final ProductsUsecase usecase;

  final BehaviorSubject<ApiResponse<ProductsEntity>> _response =
      BehaviorSubject<ApiResponse<ProductsEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<ProductsEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<ProductsEntity>> get dataSink => _response.sink;

  Future getPopular(bool isRefresh) async {
    if (isRefresh == true) dataSink.add(ApiResponse.loading("loading..."));
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
  final ProductsUsecase usecase;

  final BehaviorSubject<ApiResponse<ProductsEntity>> _response =
      BehaviorSubject<ApiResponse<ProductsEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<ProductsEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<ProductsEntity>> get dataSink => _response.sink;

  Future getRecent(bool isRefresh) async {
    if (isRefresh == true) dataSink.add(ApiResponse.loading("loading..."));
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
  final ProductsUsecase usecase;

  final BehaviorSubject<ApiResponse<ProductsEntity>> _response =
      BehaviorSubject<ApiResponse<ProductsEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<ProductsEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<ProductsEntity>> get dataSink => _response.sink;

  Future getForYou(bool isRefresh) async {
    if (isRefresh == true) dataSink.add(ApiResponse.loading("loading..."));
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

class GetSuggestionService {
  GetSuggestionService(this.usecase);

  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();
  final ProductsUsecase usecase;

  final BehaviorSubject<ApiResponse<ProductsEntity>> _response =
      BehaviorSubject<ApiResponse<ProductsEntity>>.seeded(
          ApiResponse.loading("loading..."));

  Stream<ApiResponse<ProductsEntity>> get dataStream => _response.stream;

  Sink<ApiResponse<ProductsEntity>> get dataSink => _response.sink;

  Future getSuggestions(bool isRefresh) async {
    if (isRefresh == true) dataSink.add(ApiResponse.loading("loading..."));
    final result = await usecase(PageConfigEntity(
      perPage: 2,
      page: 1,
      productType: ProductType.suggestions,
      appToken: _getAuthenticatedUserService.currentUser!.appToken!,
    ));

    ApiResponse<ProductsEntity> response =
        result.fold((l) => ApiResponse.error('$l'), (r) {
      return ApiResponse.completed(r);
    });

    dataSink.add(response);
  }
}
