import 'package:equatable/equatable.dart';
import 'package:wambo/core/utils/enums.dart';

class PageConfigEntity extends Equatable {
  PageConfigEntity({
    this.perPage,
    this.page,
    this.filter,
    this.search,
    this.order,
    this.productType,
    required this.appToken,
     this.token,
  });
  final int? perPage;
  final int? page;
  final String? filter;
  final String? search;
  final String? order;
  final ProductType? productType;
  final String appToken;
  final String? token;

  @override
  List<Object?> get props =>
      [perPage, page, filter, search, order, productType, appToken, token];
}
