import 'dart:async';
import 'dart:io';
import '../errors/exception.dart';

mixin NetworkDataHelper<T> {
  Future<T> requestFromDataSource(Future<T> request) async {
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
