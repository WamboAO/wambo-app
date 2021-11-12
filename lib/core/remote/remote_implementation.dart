import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/interfaces/remote_interface.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class RemoteImplementation implements IRemote {
  final _client = http.Client();
  final String baseURL = dotenv.env['BASE_URL']!;

  @override
  Future delete(
      {required String query,
      required Map<String, String> header,
      body,
      String? debugType}) async {
    try {
      var uri = Uri.encodeFull('$baseURL/$query');
      var url = Uri.parse(uri);
      final response = await _client.delete(url,
          headers: header,
          body: body != null ? json.encode(body.toJson()) : null);
      Map<String, dynamic> responseJson = returnResponse(response);
      return responseJson;
    } on SocketException {
      throw  FetchDataException('Sem conexão com a Internet');
    } on HttpException {
      throw  FetchDataException('O que procuras não existe');
    } on FormatException {
      throw  FetchDataException('Formato da resposta ruim');
    } on TimeoutException {
      throw  FetchDataException('O pedido demorou muito');
    } on Exception catch (e) {
      throw FetchDataException('$e');
    }
  }

  @override
  Future get(
      {required String query,
      required Map<String, String> header,
      String? debugType}) async {
    try {
      var uri = Uri.encodeFull('$baseURL/$query');
      var url = Uri.parse(uri);

      final response = await _client.get(url, headers: header);
      Map<String, dynamic> responseJson = returnResponse(response);

      return responseJson;
    } on SocketException {
      throw  FetchDataException('Sem conexão com a Internet');
    } on HttpException {
      throw  FetchDataException('O que procuras não existe');
    } on FormatException {
      throw  FetchDataException('Formato da resposta ruim');
    } on TimeoutException {
      throw  FetchDataException('O pedido demorou muito');
    } on Exception catch (e) {
      throw FetchDataException('$e');
    }
  }

  @override
  Future patch(
      {required String query,
      required Map<String, String> header,
      body,
      String? debugType}) async {
    try {
      var uri = Uri.encodeFull('$baseURL/$query');
      var url = Uri.parse(uri);

      http.Response response = await _client.patch(url,
          headers: header,
          body: body != null ? json.encode(body.toJson()) : null);
      Map<String, dynamic> responseJson = returnResponse(response);

      return responseJson;
    } on SocketException {
      throw  FetchDataException('Sem conexão com a Internet');
    } on HttpException {
      throw  FetchDataException('O que procuras não existe');
    } on FormatException {
      throw  FetchDataException('Formato da resposta ruim');
    } on TimeoutException {
      throw  FetchDataException('O pedido demorou muito');
    } on Exception catch (e) {
      throw FetchDataException('$e');
    }
  }

  @override
  Future post(
      {required String query,
      required Map<String, String> header,
      body,
      String? debugType}) async {
    try {
      var uri = Uri.encodeFull('$baseURL/$query');
      var url = Uri.parse(uri);

      http.Response response = await _client.post(url,
          headers: header,
          body: body != null ? json.encode(body.toJson()) : null);
      Map<String, dynamic> responseJson = returnResponse(response);

      return responseJson;
    } on SocketException {
      throw  FetchDataException('Sem conexão com a Internet');
    } on HttpException {
      throw  FetchDataException('O que procuras não existe');
    } on FormatException {
      throw  FetchDataException('Formato da resposta ruim');
    } on TimeoutException {
      throw  FetchDataException('O pedido demorou muito');
    } on Exception catch (e) {
      throw FetchDataException('$e');
    }
  }

  @override
  Future put(
      {required String query,
      required Map<String, String> header,
      body,
      String? debugType}) async {
    try {
      var uri = Uri.encodeFull('$baseURL/$query');
      var url = Uri.parse(uri);

      final response = await _client.put(url,
          headers: header,
          body: body != null ? json.encode(body.toJson()) : null);
      Map<String, dynamic> responseJson = returnResponse(response);

      return responseJson;
    } on SocketException {
      throw  FetchDataException('Sem conexão com a Internet');
    } on HttpException {
      throw  FetchDataException('O que procuras não existe');
    } on FormatException {
      throw  FetchDataException('Formato da resposta ruim');
    } on TimeoutException {
      throw  FetchDataException('O pedido demorou muito');
    } on Exception catch (e) {
      throw FetchDataException('$e');
    }
  }

  @override
  Map<String, dynamic> returnResponse(http.Response response) {
    Map<String, dynamic> data = json.decode(response.body);

    switch (response.statusCode) {
      case 201:
      case 200:
        return data;
      //WARNING: api's can be unrealiable so you
      //may create your own exception error message

      case 400:
        throw BadRequestException(data['message']);
      case 401:
      case 403:
        throw UnauthorisedException(data['message']);
      case 404:
        throw NotFoundException(data['message']);
      case 500:
      default:
        throw FetchDataException(data['message']);
    }
  }
}
