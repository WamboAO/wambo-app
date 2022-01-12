import 'package:equatable/equatable.dart';

class SearchItemsEntity extends Equatable {
  SearchItemsEntity({required this.data});

  final List<SearchItemsDataEntity> data;

  @override
  List<Object?> get props => [data];
}

class SearchItemsDataEntity extends Equatable {
  SearchItemsDataEntity({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}
