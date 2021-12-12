import 'package:equatable/equatable.dart';

class PageConfigEntity extends Equatable {
  PageConfigEntity({
    this.perPage,
    this.page,
    this.filter,
    this.search,
    this.order,
    required this.appToken,
    required this.token,
  });
  final int? perPage;
  final int? page;
  final String? filter;
  final String? search;
  final String? order;
  final String appToken;
  final String token;

  @override
  List<Object?> get props => [perPage, page, filter, search, order, appToken, token];
}
