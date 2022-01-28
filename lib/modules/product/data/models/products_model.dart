import 'package:wambo/modules/product/domain/entities/products_entity.dart';

class ProductsModel extends ProductsEntity {
  ProductsModel({required String message, required List<ProductDataModel> data})
      : super(message: message, data: data);
  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    List<ProductDataModel> _data = <ProductDataModel>[];

    json['data'].forEach((v) {
      _data.add(ProductDataModel.fromJson(v));
    });

    return ProductsModel(message: json['message'], data: _data);
  }
}

class ProductModel extends ProductEntity {
  ProductModel({required String message, ProductDataModel? data})
      : super(message: message, data: data);
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      message: json['message'],
      data: json['data'] != null
          ? ProductDataModel.fromJson(json['data'])
          : null);
}

class ProductDataModel extends ProductDataEntity {
  ProductDataModel({
    required int id,
    required String thumbnail,
    required String name,
    required String permaLink,
    required String createdAt,
    required String description,
    required int price,
    required String currency,
    required int regularPrice,
    int? salePrice,
    String? dateOnSaleFrom,
    String? dateOnSaleTo,
    required bool onSale,
    required int stockQuantity,
    required bool inStock,
    required ProductDetailsEntity? details,
  }) : super(
            id: id,
            thumbnail: thumbnail,
            currency: currency,
            name: name,
            permaLink: permaLink,
            description: description,
            regularPrice: regularPrice,
            salePrice: salePrice,
            dateOnSaleFrom: dateOnSaleFrom,
            dateOnSaleTo: dateOnSaleTo,
            onSale: onSale,
            stockQuantity: stockQuantity,
            inStock: inStock,
            price: price,
            details: details,
            createdAt: createdAt);

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      ProductDataModel(
          id: json['id'],
          thumbnail: json['thumbnail'],
          name: json['name'],
          currency: json['currency'],
          permaLink: json['permalink'],
          description: json['description'],
          regularPrice: json['regular_price'],
          salePrice: json['sale_price'],
          dateOnSaleFrom: json['date_on_sale_from'],
          dateOnSaleTo: json['date_on_sale_to'],
          onSale: json['on_sale'],
          stockQuantity: json['stock_quantity'],
          inStock: json['in_stock'],
          price: json['price'],
          createdAt: json['created_at'],
          details: json['details'] != null
              ? ProductDetailsModel.fromJson(json['details'])
              : null);
}

class ProductDetailsModel extends ProductDetailsEntity {
  ProductDetailsModel({
    required bool backordersAllowed,
    required bool soldIndividually,
    required String sku,
    required double weight,
    DimensionsModel? dimensions,
    required bool shippingTaxableByDistance,
    int? shippingTax,
    required List<ProductCategoriesModel> categories,
    required List<ProductTagsModel> tags,
    required List<ProductImagesModel> images,
    required List<ProductAttributesModel> attributes,
  }) : super(
            backordersAllowed: backordersAllowed,
            soldIndividually: soldIndividually,
            sku: sku,
            weight: weight,
            dimensions: dimensions,
            shippingTaxableByDistance: shippingTaxableByDistance,
            shippingTax: shippingTax,
            images: images,
            attributes: attributes,
            tags: tags,
            categories: categories);
  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    List<ProductImagesModel> _images = <ProductImagesModel>[];
    json['images'].forEach((v) {
      _images.add(ProductImagesModel.fromJson(v));
    });
    List<ProductTagsModel> _tags = <ProductTagsModel>[];
    json['tags'].forEach((v) {
      _tags.add(ProductTagsModel.fromJson(v));
    });

    List<ProductAttributesModel> _attributes = <ProductAttributesModel>[];
    json['attributes'].forEach((v) {
      _attributes.add(ProductAttributesModel.fromJson(v));
    });

    List<ProductCategoriesModel> _categories = <ProductCategoriesModel>[];
    json['categories'].forEach((v) {
      _categories.add(ProductCategoriesModel.fromJson(v));
    });

    return ProductDetailsModel(
        backordersAllowed: json['backorders_allowed'],
        soldIndividually: json['sold_individually'],
        sku: json['sku'],
        weight: json['weight'],
        dimensions: json['dimensions'] != null
            ? DimensionsModel.fromJson(json['dimensions'])
            : null,
        shippingTaxableByDistance: json['shipping_taxable_by_distance'],
        shippingTax: json['shipping_tax'],
        images: _images,
        attributes: _attributes,
        tags: _tags,
        categories: _categories);
  }
}

class DimensionsModel extends DimensionsEntity {
  DimensionsModel({
    required double length,
    required double width,
    required double height,
  }) : super(length: length, width: width, height: height);

  factory DimensionsModel.fromJson(Map<String, dynamic> json) =>
      DimensionsModel(
          length: json['length'], width: json['width'], height: json['height']);
}

class ProductImagesModel extends ProductImagesEntity {
  ProductImagesModel({
    required int id,
    required String src,
    required String name,
    required String alt,
    required bool isThumbnail,
    required String createdAt,
  }) : super(
            id: id,
            src: src,
            name: name,
            alt: alt,
            createdAt: createdAt,
            isThumbnail: isThumbnail);
  factory ProductImagesModel.fromJson(Map<String, dynamic> json) =>
      ProductImagesModel(
          id: json['id'],
          createdAt: json['created_at'],
          name: json['name'],
          alt: json['alt'],
          isThumbnail: json['is_thumbnail'],
          src: json['src']);
}
class ProductAttributesModel extends ProductAttributesEntity {
  ProductAttributesModel({
    required int id,
  required String name,
  required int position,
  required bool variation,
  required List<String> options,
  }) : super(id:id, name: name, position: position, variation: variation, options: options);
  

  factory ProductAttributesModel.fromJson(Map<String, dynamic> json) =>
      ProductAttributesModel(
        id: json['id'],
        name: json['name'],
        position: json['position'],
        variation: json['variation'],
        options: json['options'].cast<String>()
      );
}



class ProductCategoriesModel extends ProductCategoriesEntity {
  ProductCategoriesModel({
    required int id,
    required String name,
    required String slug,
  }) : super(id: id, name: name, slug: slug);
  factory ProductCategoriesModel.fromJson(Map<String, dynamic> json) =>
      ProductCategoriesModel(
        id: json['id'],
        name: json['name'],
        slug: json['slug'],
      );
}



class ProductTagsModel extends ProductTagsEntity {
  ProductTagsModel({
    required int id,
    required String name,
    required String slug,
  }) : super(id: id, name: name, slug: slug);
  factory ProductTagsModel.fromJson(Map<String, dynamic> json) =>
      ProductTagsModel(
        id: json['id'],
        name: json['name'],
        slug: json['slug'],
      );
}