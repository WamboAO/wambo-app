import 'package:equatable/equatable.dart';

class ProductsEntity extends Equatable {
  ProductsEntity({required this.message, required this.data});

  final String message;
  final List<ProductDataEntity> data;
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
      required this.thumbnail,
      required this.name,
      required this.permaLink,
      required this.createdAt,
      required this.description,
      required this.price,
      required this.currency,
      required this.regularPrice,
      this.salePrice,
      this.dateOnSaleFrom,
      this.dateOnSaleTo,
      required this.onSale,
      required this.stockQuantity,
      required this.inStock,
      this.details});
  final int id;
  final String thumbnail;
  final String name;
  final String permaLink;
  final String currency;
  final String createdAt;
  final String description;
  final int price;
  final int regularPrice;
  final int? salePrice;
  final String? dateOnSaleFrom;
  final String? dateOnSaleTo;
  final bool onSale;
  final int stockQuantity;
  final bool inStock;
  final ProductDetailsEntity? details;

  @override
  List<Object?> get props => [
        id,
        thumbnail,
        name,
        permaLink,
        createdAt,
        description,
        price,
        regularPrice,
        salePrice,
        currency,
        dateOnSaleFrom,
        dateOnSaleTo,
        onSale,
        stockQuantity,
        inStock,
        details
      ];
}

class ProductDetailsEntity extends Equatable {
  ProductDetailsEntity({
    required this.backordersAllowed,
    required this.soldIndividually,
    required this.sku,
    required this.weight,
    this.dimensions,
    required this.shippingTaxableByDistance,
    this.shippingTax,
    required this.categories,
    required this.tags,
    required this.images,
    required this.attributes,
  });
  final bool backordersAllowed;
  final bool soldIndividually;
  final String sku;
  final double weight;
  final DimensionsEntity? dimensions;
  final bool shippingTaxableByDistance;
  final int? shippingTax;
  final List<ProductCategoriesEntity> categories;
  final List<ProductTagsEntity> tags;
  final List<ProductImagesEntity> images;
  final List<ProductAttributesEntity> attributes;

  @override
  List<Object?> get props => [
        backordersAllowed,
        soldIndividually,
        sku,
        weight,
        dimensions,
        shippingTaxableByDistance,
        shippingTax,
        categories,
        tags,
        images,
        attributes,
      ];
}

class DimensionsEntity extends Equatable {
  DimensionsEntity({
    required this.length,
    required this.width,
    required this.height,
  });
  final double length;
  final double width;
  final double height;

  @override
  List<Object?> get props => [length, width, height];
}

class ProductImagesEntity extends Equatable {
  ProductImagesEntity(
      {required this.id,
      required this.src,
      required this.name,
      required this.alt,
      required this.isThumbnail,
      required this.createdAt});
  final int id;
  final String src;
  final String name;
  final String alt;
  final bool isThumbnail;
  final String createdAt;

  @override
  List<Object?> get props => [id, src, name, alt, isThumbnail, createdAt];
}

class ProductCategoriesEntity extends Equatable {
  ProductCategoriesEntity(
      {required this.id, required this.name, required this.slug});
  final int id;
  final String name;
  final String slug;

  @override
  List<Object?> get props => [id, name, slug];
}

class ProductTagsEntity extends Equatable {
  ProductTagsEntity({
    required this.id,
    required this.name,
    required this.slug,
  });
  final int id;
  final String name;
  final String slug;

  @override
  List<Object?> get props => [id, name, slug];
}

class ProductAttributesEntity extends Equatable {
  ProductAttributesEntity({
    required this.id,
    required this.name,
    required this.position,
    required this.variation,
    required this.options,
  });
  final int id;
  final String name;
  final int position;
  final bool variation;
  final List<String> options;

  @override
  List<Object?> get props => [id, name, position, variation, options];
}
