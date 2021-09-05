import 'package:dio/dio.dart';
import 'exception_helpers.dart';

mixin ApiDataHelper<T> {
  dynamic returnResponse(Response<T> response) {
    var msg = response.data;

    switch (response.statusCode) {
      case 201:
      case 200:
        return response.data;
      //WARNING: api's can be unrealiable so you 
      //may create your own exception error message

      case 400:
        return BadRequestException(msg.toString());
      case 401:
      case 403:
        return UnauthorisedException(msg.toString());
      case 404:
        return NotFoundException(msg.toString());
      case 500:
      default:
        return FetchDataException(
            'Ocorreu um erro durante a comunicação com o servidor com código : ${response.statusCode}');
    }
  }
}
