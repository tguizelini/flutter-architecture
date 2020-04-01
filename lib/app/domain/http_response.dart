class HttpResponse {
  int status = 400;
  String message = "";
  dynamic data;

  HttpResponse({ this.status, this.message, this.data });
}
