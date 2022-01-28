import 'package:wambo/modules/search/domain/entities/search_items_entity.dart';

class SearchItemsModel extends SearchItemsEntity {
  SearchItemsModel({required List<SearchItemsDataModel> data})
      : super(data: data);


  factory SearchItemsModel.fromJson(Map<String, dynamic> json) {
    List<SearchItemsDataModel> data = <SearchItemsDataModel>[];
    json['data'].forEach((v) {
      data.add(SearchItemsDataModel.fromJson(v));
    });
    return SearchItemsModel(data: data);
  }

  Map<String, dynamic> toJson() => {
        "data": [
          for (var item in data) {
            "id": item.id,
            "name": item.name,
            
          }
        ]
      };
}

class SearchItemsDataModel extends SearchItemsDataEntity {
  SearchItemsDataModel({ int? id, required String name})
      : super(id: id, name: name);
  
  factory SearchItemsDataModel.fromJson(Map<String, dynamic> json) =>
      SearchItemsDataModel(id: json['id'], name: json['name']);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
