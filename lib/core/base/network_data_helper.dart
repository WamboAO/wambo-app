import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'exception_helpers.dart';

mixin NetworkDataHelper {
  
  Future requestFromDataSource(Future request) async {
    try {
      final result = await request;
      return result;
    } on SocketException {
      return Left(FetchDataException('Sem conexão com a Internet'));
    } on HttpException {
      return Left(FetchDataException('O que procuras não existe'));
    } on FormatException {
      return Left(FetchDataException('Formato da resposta ruim'));
    } on TimeoutException {
      return Left(
          FetchDataException('O pedido demorou muito. Tenta novamente'));
    } on IOException {
      return Left(
          FetchDataException('Operação de input/output falhou'));
    } on Exception  {
      return Left(FetchDataException('Erro desconhecido'));
    }  
  }
}