class ApiHeaders {
  setTokenHeaders({required String token,required String appToken}) => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'App-Configuration': appToken
      };

setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      
      };
  setAuthHeaders(String appToken) => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'App-Configuration': appToken
      };
}
