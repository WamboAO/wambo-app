import 'package:wambo/features/startup/domain/entities/generic_entity.dart';

class GenericModel extends GenericEntity {
  GenericModel({required String message}) : super(message: message);

  factory GenericModel.fromJson(Map<String, dynamic> json) =>
      GenericModel(message: json['message']);

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
