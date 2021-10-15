import 'package:equatable/equatable.dart';

class GenericEntity extends Equatable {
  GenericEntity({required this.message});
  final String message;
  @override
  List<Object?> get props => [message];
}

class GenericModel extends GenericEntity {
  GenericModel({required String message}) : super(message: message);
  factory GenericModel.fromJson(Map<String, dynamic> json) =>
      GenericModel(message: json['message']);
}
