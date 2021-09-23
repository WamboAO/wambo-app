abstract class IRemote {
  Future get({required String query, required Map<String , String> header});
  Future post({required String query, required Map<String , String> header, dynamic body });
  Future patch({required String query, required Map<String , String> header, dynamic body });
  Future put({required String query, required Map<String , String> header, dynamic body });
  Future delete({required String query, required Map<String , String> header, dynamic body});
}