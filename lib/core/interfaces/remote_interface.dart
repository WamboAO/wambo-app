import 'package:http/http.dart';

abstract class IRemote {
  Future get({required String query, required Map<String , String> header, String? debugType});
  Future post({required String query, required Map<String , String> header, dynamic body, String? debugType});
  Future patch({required String query, required Map<String , String> header, dynamic body, String? debugType});
  Future put({required String query, required Map<String , String> header, dynamic body, String? debugType});
  Future delete({required String query, required Map<String , String> header, dynamic body, String? debugType});
  Map<String, dynamic> returnResponse(Response response); 
}