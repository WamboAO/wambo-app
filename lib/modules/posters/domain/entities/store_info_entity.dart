import 'package:equatable/equatable.dart';

class StoreInfoEntity extends Equatable {
  StoreInfoEntity({
    required this.message,
    required this.data,
  });
  final String message;
  final List<StoreInfoDataEntity> data;

  @override
  List<Object?> get props => [message, data];
}

class StoreInfoDataEntity extends Equatable {
  StoreInfoDataEntity({
    required this.id,
    required this.image,
    required this.tag,
  });
  final int id;
  final String image;
  final String tag;

  @override
  List<Object?> get props => [id, image, tag];
}


