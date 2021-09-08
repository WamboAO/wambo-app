import 'package:equatable/equatable.dart';

abstract class ExceptionHelper extends Equatable implements Exception {
  ExceptionHelper([this._message]);
  // ignore: prefer_typing_uninitialized_variables
  final _message;

  @override
  String toString() {
    return "$_message";
  }
}

class FetchDataException extends ExceptionHelper {
  FetchDataException([String? message]) : super(message);

  @override
  List<Object?> get props => [];
}

class BadRequestException extends ExceptionHelper {
  BadRequestException([String? message]) : super(message);
  @override
  List<Object?> get props => [];
}

class UnauthorisedException extends ExceptionHelper {
  UnauthorisedException([String? message]) : super(message);
  @override
  List<Object?> get props => [];
}

class InvalidInputException extends ExceptionHelper {
  InvalidInputException([String? message]) : super(message);
  @override
  List<Object?> get props => [];
}

class NotFoundException extends ExceptionHelper {
  NotFoundException([String? message]) : super(message);
  @override
  List<Object?> get props => [];
}
