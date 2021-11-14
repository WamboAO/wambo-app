import 'package:equatable/equatable.dart';

class PageConfigEntity extends Equatable {
   PageConfigEntity({
    required this.perPage,
    required this.page,
    required this.appToken,
    required this.token,
  });
  final int perPage;
  final int page;
  final String appToken;
  final String token;
 

  @override
  List<Object?> get props => [perPage, page, appToken, token];
}
