class HttpResponse {
  int statusCode = 200;
  String message = "";
  dynamic data;

  HttpResponse({ this.statusCode, this.message, this.data });
}
