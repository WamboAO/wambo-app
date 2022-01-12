import 'package:wambo/modules/search/domain/entities/search_items_entity.dart';

class SearchItemsModel extends SearchItemsEntity {
  SearchItemsModel({required List<SearchItemsDataModel> data}) : super(data: data);
  factory SearchItemsModel.fromJson(Map<String, dynamic> json) {
    List<SearchItemsDataModel> _data = <SearchItemsDataModel>[];
    json['data'].forEach((v) {
      _data.add(SearchItemsDataModel.fromJson(v));
    });

    return SearchItemsModel(data: _data);
  }
}

class SearchItemsDataModel extends SearchItemsDataEntity {
  SearchItemsDataModel({required int id, required String name})
      : super(id: id, name: name);

  factory SearchItemsDataModel.fromJson(Map<String, dynamic> json) =>
      SearchItemsDataModel(id: json['id'], name: json['name']);
}
