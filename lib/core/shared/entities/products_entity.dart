import 'package:equatable/equatable.dart';

class ProductsEntity extends Equatable {
  ProductsEntity({required this.message, this.data});

  final String message;
  final List<ProductDataEntity>? data;
  @override
  List<Object?> get props => [message, data];
}

class ProductEntity extends Equatable {
  ProductEntity({required this.message, this.data});

  final String message;
  final ProductDataEntity? data;
  @override
  List<Object?> get props => [message, data];
}

class ProductDataEntity extends Equatable {
  ProductDataEntity(
      {required this.id,
      required this.title,
      required this.likeCount,
      required this.createdAt,
      required this.thumbnail,
      required this.boughtCount,
      required this.inStock,
      required this.currency,
      this.discount,
      this.details,
      required this.price});

  final int id;
  final String title;
  final String thumbnail;
  final bool inStock;
  final int likeCount;
  final int boughtCount;
  final String currency;
  final double? discount;
  final int price;
  final ProductDetailsEntity? details;
  final String createdAt;
  @override
  List<Object?> get props => [
        id,
        title,
        thumbnail,
        currency,
        likeCount,
        boughtCount,
        inStock,
        discount,
        price,
        details,
        createdAt
      ];
}

class ProductDetailsEntity extends Equatable {
  ProductDetailsEntity({
    required this.images,
    required this.category,
    required this.stock,
    required this.description,
    this.tags,
  });
  final int stock;
  final String description;
  final List<ProductImageEntity> images;
  final List<ProductTagsEntity>? tags;
  final String category;

  @override
  List<Object?> get props => [stock, images, category, tags, description];
}

class ProductImageEntity extends Equatable {
  ProductImageEntity(
      {required this.id, required this.blob, required this.isThumbnail});
  final int id;
  final String blob;
  final bool isThumbnail;

  @override
  List<Object?> get props => [id, blob, isThumbnail];
}

class ProductTagsEntity extends Equatable {
  ProductTagsEntity({
    required this.id,
    required this.tag,
  });
  final int id;
  final String tag;

  @override
  List<Object?> get props => [id, tag];
}
