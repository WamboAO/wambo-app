import 'package:wambo/modules/store/domain/entities/categories_entity.dart';

class CategoriesModel extends CategoriesEntity {
  CategoriesModel({required String message, required List<CategoriesDataModel> data}) : super(message: message, data: data);
   factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    List<CategoriesDataModel> _data = <CategoriesDataModel>[];
    json['data'].forEach((v) {
      _data.add(CategoriesDataModel.fromJson(v));
    });
  
    return CategoriesModel(message: json['message'], data: _data);
  }
}

class CategoriesDataModel extends CategoriesDataEntity {
  CategoriesDataModel({required int id, required String category, required bool isActive}) : super(id: id, category: category, isActive: isActive);
   factory CategoriesDataModel.fromJson(Map<String, dynamic> json) =>
      CategoriesDataModel(
          id: json['id'],
          category: json['category'],
          isActive: json['is_active']);
}