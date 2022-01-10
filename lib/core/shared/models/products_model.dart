import 'package:wambo/core/shared/entities/products_entity.dart';
class ProductsModel extends ProductsEntity {
  ProductsModel({required String message,  List<ProductDataModel>? data}) : super(message: message, data: data);
 factory ProductsModel.fromJson(Map<String, dynamic> json) {
    List<ProductDataModel> _data = <ProductDataModel>[];
    if(json['data'] !=null){
       json['data'].forEach((v) {
      _data.add(ProductDataModel.fromJson(v));
    });
    }
   
   

    return ProductsModel(
        message: json['message'],
          data:  _data);
  }
}

class ProductModel extends ProductEntity {
  ProductModel({required String message,  ProductDataModel? data}) : super(message: message, data: data);
   factory ProductModel.fromJson(Map<String, dynamic> json) =>
      ProductModel(
         message: json['message'],
          data: json['data'] !=null? ProductDataModel.fromJson(json['data']): null
              );
}

class ProductDataModel extends ProductDataEntity {
  ProductDataModel(
      {required int id,
      required String title,
      required String thumbnail,
      required bool inStock,
      required int likeCount,
      double? discount,
      required int price,
      required ProductDetailsEntity? details,
      required String createdAt})
      : super(
            id: id,
            title: title,
            thumbnail: thumbnail,
            inStock: inStock,
            likeCount: likeCount,
            discount: discount,
            price: price,
            details: details,
            createdAt: createdAt);

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      ProductDataModel(
          id: json['id'],
          title: json['title'],
          thumbnail: json['thumbnail'],
          discount: json['discount'],
          inStock: json['in_stock'],
          likeCount: json['like_count'],
          price: json['price'],
          createdAt: json['created_at'],
          details: json['details'] != null
              ? ProductDetailsModel.fromJson(json['details'])
              : null);
}

class ProductDetailsModel extends ProductDetailsEntity {
  ProductDetailsModel({
    required int stock,
    required List<ProductImageEntity> images,
    required String description,
    List<ProductTagsEntity>? tags,
    required String category,
  }) : super(
          stock: stock,
          images: images,
          description: description,
          tags: tags,
          category: category,
        );
  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    List<ProductImageModel> _images = <ProductImageModel>[];
    json['images'].forEach((v) {
      _images.add(ProductImageModel.fromJson(v));
    });
    List<ProductTagsModel> _tags = <ProductTagsModel>[];
    json['tags'].forEach((v) {
      _tags.add(ProductTagsModel.fromJson(v));
    });

    return ProductDetailsModel(
        stock: json["stock"],
        images: _images,
        tags: _tags,
        description: json["description"],
        category: json["category"]);
  }
}

class ProductImageModel extends ProductImageEntity {
  ProductImageModel(
      {required int id, required String blob, required bool isThumbnail})
      : super(id: id, blob: blob, isThumbnail: isThumbnail);
  factory ProductImageModel.fromJson(Map<String, dynamic> json) =>
      ProductImageModel(
          id: json['id'],
          blob: json['blob'],
          isThumbnail: json['is_thumbnail']);
}

class ProductTagsModel extends ProductTagsEntity {
  ProductTagsModel({required int id, required String tag})
      : super(id: id, tag: tag);
  factory ProductTagsModel.fromJson(Map<String, dynamic> json) =>
      ProductTagsModel(id: json['id'], tag: json['tag']);
}
