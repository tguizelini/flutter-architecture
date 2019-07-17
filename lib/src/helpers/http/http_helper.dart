import 'package:dio/dio.dart';
import 'package:flutter_architecture/src/helpers/storage/storage_helper.dart';
import 'package:flutter_architecture/src/helpers/storage/storage_keys.dart';
import 'package:flutter_architecture/src/repositories/base/base_url.dart' as BASE_URL;

class HttpHelper {
  static Dio _client;

  static Future<Dio> _getInstance({ bool isAuth, Map<String, dynamic> headers }) async {
    if (_client == null) _client = Dio();

    if (isAuth == true) {
      _client.options.headers = {
        "Content-Type": "x-www-form-urlencoded"
      };

      return _client;
    }

    if (headers != null) {
      _client.options.headers = headers;
      return _client;
    }

    final token = await StorageHelper.get(StorageKeys.token);
    final cookie = await StorageHelper.get(StorageKeys.cookie);
    
    _client.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    return _client;
  }

  static Future<Response> authSSO(String codigo, String senha) async {
    final String url = BASE_URL.auth;

    final instance = await _getInstance(isAuth: true);

    FormData payload = new FormData.from({
      "grant_type": "password",
      "scope": "scope1 scope2 scope3",
      "username": codigo,
      "password": senha,
      "client_id": "my_client_name",
      "client_secret": "secret"
    });

    return instance.post(url, data: payload);
  }

  static Future<Response> get(String url, { Map<String, dynamic> headers }) async {
    final instance = await _getInstance(headers: headers);
    return instance.get(url);
  }

  static Future<Response> post(String url, { Map<String, dynamic> body, Map<String, dynamic> headers }) async {
    final instance = await _getInstance(headers: headers);
    return instance.post(url, data: body);
  } 

  static Future<Response> put(String url, { Map<String, dynamic> body, Map<String, dynamic> headers }) async {
    final instance = await _getInstance(headers: headers);
    return instance.put(url, data: body);
  } 

  static Future<Response> delete(String url, { Map<String, dynamic> body, Map<String, dynamic> headers }) async {
    final instance = await _getInstance(headers: headers);
    return instance.delete(url);
  } 
}