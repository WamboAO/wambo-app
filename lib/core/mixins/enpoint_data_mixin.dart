import 'dart:async';
import 'dart:io';
import '../errors/exception.dart';

mixin EndpointDataHelper<T> {
  Future<T> requestFromEndpoint(Future<T> request) async {
    try {
      final result = await request;
      return result;
    } on SocketException {
      throw FetchDataException('Sem conexão com a Internet');
    } on HttpException {
      throw FetchDataException('O que procuras não existe');
    } on FormatException {
      throw FetchDataException('Formato da resposta ruim');
    } on TimeoutException {
      throw FetchDataException('O pedido demorou muito');
    } on Exception catch (e) {
      throw FetchDataException('$e');
    }
  }
}


