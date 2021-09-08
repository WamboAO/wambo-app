import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([this._message]);
  // ignore: prefer_typing_uninitialized_variables
  final _message;

  @override
  String toString() {
    return '$_message';
  }
}


class FetchDataFailure extends Failure {
  FetchDataFailure([String? message]) : super(message);
  
   @override
  List<Object?> get props => [];
}
