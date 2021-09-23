import 'dart:convert';

import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/core/interfaces/remote_interface.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wambo/core/mixins/api_data_mixin.dart';
import 'package:wambo/core/mixins/network_data_mixin.dart';
import 'package:http/http.dart' as http;

class RemoteImplementation
    with NetworkDataHelper<http.Response>, ApiDataHelper
    implements IRemote {

  final _client = http.Client();
  final String baseURL = dotenv.env['BASE_URL']!;
  
  @override
  Future delete(
      {required String query,
      required Map<String, String> header,
      body}) async {
    try {
      var uri = Uri.encodeFull('$baseURL/$query');
      var url = Uri.parse(uri);

      http.Response response = await requestFromDataSource(_client.delete(url,
          headers: header,
          body: body != null ? json.encode(body.toJson()) : null));
      Map<String, dynamic> responseJson = returnResponse(response);

      return responseJson;
    } on FetchDataException catch (e) {
      throw FetchDataFailure("$e");
    }
  }

  @override
  Future get(
      {required String query, required Map<String, String> header}) async {
    try {
      var uri = Uri.encodeFull('$baseURL/$query');
      var url = Uri.parse(uri);

      http.Response response =
          await requestFromDataSource(_client.get(url, headers: header));
      Map<String, dynamic> responseJson = returnResponse(response);

      return responseJson;
    } on FetchDataException catch (e) {
      throw FetchDataFailure("$e");
    }
  }

  @override
  Future patch(
      {required String query, required Map<String, String> header, body}) async{
    try {
      var uri = Uri.encodeFull('$baseURL/$query');
      var url = Uri.parse(uri);

      http.Response response = await requestFromDataSource(_client.patch(url,
          headers: header,
          body: body != null ? json.encode(body.toJson()) : null));
      Map<String, dynamic> responseJson = returnResponse(response);

      return responseJson;
    } on FetchDataException catch (e) {
      throw FetchDataFailure("$e");
    }
  }

  @override
  Future post(
      {required String query, required Map<String, String> header, body}) async{
    try {
      var uri = Uri.encodeFull('$baseURL/$query');
      var url = Uri.parse(uri);

      http.Response response = await requestFromDataSource(_client.post(url,
          headers: header,
          body: body != null ? json.encode(body.toJson()) : null));
      Map<String, dynamic> responseJson = returnResponse(response);

      return responseJson;
    } on FetchDataException catch (e) {
      throw FetchDataFailure("$e");
    }
  }

  @override
  Future put(
      {required String query, required Map<String, String> header, body}) async{
    try {
      var uri = Uri.encodeFull('$baseURL/$query');
      var url = Uri.parse(uri);

      http.Response response = await requestFromDataSource(_client.put(url,
          headers: header,
          body: body != null ? json.encode(body.toJson()) : null));
      Map<String, dynamic> responseJson = returnResponse(response);

      return responseJson;
    } on FetchDataException catch (e) {
      throw FetchDataFailure("$e");
    }
  }
}