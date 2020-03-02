class ResponseModel {
  int status = 400;
  String message = "";
  dynamic data;

  ResponseModel({ this.status, this.message, this.data });
}
