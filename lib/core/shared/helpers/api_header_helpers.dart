class ApiHeaders {
  setTokenHeaders(String token) => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

  setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
