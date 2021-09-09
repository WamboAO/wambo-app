import 'dart:convert';

import 'package:dio/dio.dart';
import '../errors/exception.dart';

mixin ApiDataHelper<T> {
  dynamic returnResponse(Response response) {
    var data = json.decode(response.data);

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

