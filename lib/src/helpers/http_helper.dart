import 'package:flutter_architecture/src/helpers/storage_helper.dart';
import 'package:flutter_architecture/src/services/base_url.dart';
import 'package:flutter_architecture/src/utils/storage_keys.dart';
import 'package:dio/dio.dart';

class HttpHelper {
  static Dio _client;

  static Dio _initInstance({ bool isAuth }) {
    if (_client == null) {
      _client = Dio();
      _setHeader(isAuth);
      return _client;
    }

    _setHeader(isAuth);
    return _client;
  }

  static void _setHeader(bool isAuth) async {
    if (isAuth == true) {
      _client.options.headers = {
        "Content-Type": "x-www-form-urlencoded"
      };
    } else {
      final token = StorageHelper.get(StorageKeys.token);

      _client.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
    }
  }

  static Future<Response> auth(String codigo, String senha, String escritorio) async {
    final String url = BaseUrl.urlSSO;

    _initInstance(isAuth: true);

    FormData payload = new FormData.from({
      "grant_type": "password",
      "scope": "",
      "username": codigo,
      "password": senha,
      "office_code": escritorio,
      "client_id": "sistema_a_autenticar",
      "client_secret": "secret"
    });

    return _client.post(url, data: payload);
  }

  static Future<Response> get(String url) async {
    _initInstance();
    return _client.get(url);
  }

  static Future<Response> post(String url, Map<String, dynamic> body) async {
    _initInstance();
    return _client.post(url, data: body);
  } 

  static Future<Response> put(String url, Map<String, dynamic> body) async {
    _initInstance();
    return _client.put(url, data: body);
  } 

  static Future<Response> delete(String url, Map<String, dynamic> body) async {
    _initInstance();
    return _client.delete(url);
  } 
}