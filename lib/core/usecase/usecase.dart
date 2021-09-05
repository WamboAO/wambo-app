import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wambo/core/base/exception_helpers.dart';

abstract class Usecase<Output, Input> {
  Future<Either<ExceptionHelper, Output>> call(Input params);
}

class NoParams extends Equatable {

  @override
  List<Object?> get props => [];
  
}