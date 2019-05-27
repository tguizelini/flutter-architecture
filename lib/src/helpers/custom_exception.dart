class CustomException implements Exception {
  final String data;

  CustomException(this.data);

  String toString() => data;
}
