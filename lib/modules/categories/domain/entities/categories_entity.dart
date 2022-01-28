import 'package:equatable/equatable.dart';

class CategoriesEntity extends Equatable {
  CategoriesEntity({
    required this.message,
    required this.data,
  });
  final String message;
  final List<CategoriesDataEntity> data;

  @override
  List<Object?> get props => [message, data];
}

class CategoriesDataEntity extends Equatable {
  CategoriesDataEntity({
    required this.id,
    required this.category,
    required this.isActive,
  });
  final int id;
  final String category;
  final bool isActive;

  @override
  List<Object?> get props => [id, category];
}
