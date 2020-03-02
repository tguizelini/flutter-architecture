import 'package:dio/dio.dart';
import 'package:flutter_architecture/app/data/sources/storage/storage.helper.dart';

class HttpClient {
  Dio _client;

  HttpClient() {
    _client = new Dio();
  }

  Future<void> _interceptor() async {
    final storageToken = await StorageHelper.get(StorageKeys.token);

    Map<String, dynamic> headers = {};
    headers['Content-Type'] = 'application/json';
    if (storageToken != null) headers['Authorization'] = 'Bearer $storageToken';

    _client.options.headers = headers;
  }

  Future<Response> get(String url) async {
    await _interceptor();
    return _client.get(url);
  }

  Future<Response> post(String url, { dynamic body }) async {
    await _interceptor();
    return _client.post(url, data: body);
  } 

  Future<Response> put(String url, { dynamic body }) async {
    await _interceptor();
    return _client.put(url, data: body);
  } 

  Future<Response> delete(String url, { dynamic body }) async {
    await _interceptor();
    return _client.delete(url);
  } 
}