import 'package:equatable/equatable.dart';

class StoreInfoEntity extends Equatable {
  StoreInfoEntity({
    required this.message,
    required this.data,
  });
  final String message;
  final StoreInfoDataEntity data;

  @override
  List<Object?> get props => [message, data];
}

class StoreInfoDataEntity extends Equatable {
  StoreInfoDataEntity({
    required this.promo,
    required this.tags,
  });
  final List<StoreInfoPromoEntity> promo;
  final List<StoreInfoTagsEntity> tags;

  @override
  List<Object?> get props => [promo, tags];
}

class StoreInfoPromoEntity extends Equatable {
  StoreInfoPromoEntity({
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

class StoreInfoTagsEntity extends Equatable {
  StoreInfoTagsEntity({
    required this.id,
    required this.title,
    required this.description,
  });
  final int id;
  final String title;
  final String description;

  @override
  List<Object?> get props => [id, title, description];
}
