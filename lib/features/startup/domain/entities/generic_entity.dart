import 'package:equatable/equatable.dart';

class GenericEntity extends Equatable {
  GenericEntity({required this.message});
  final String message;
  @override
  List<Object?> get props => [message];
}
