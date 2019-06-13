import 'package:aasp_gerenciador/src/helpers/storage_helper.dart';
import 'package:aasp_gerenciador/src/services/base/base_url.dart' as BASE_URL;
import 'package:aasp_gerenciador/src/utils/storage_keys.dart' as StorageKeys;
import 'package:dio/dio.dart';

class HttpHelper {
  static Dio _client;

  static Future<Dio> _getInstance({ bool isAuth }) async {
    if (_client == null) _client = Dio();

    if (isAuth == true) {
      _client.options.headers = {
        "Content-Type": "x-www-form-urlencoded"
      };

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

  static Future<Response> authSSO(String codigo, String senha, String escritorio) async {
    final String url = BASE_URL.authSSO;

    final instance = await _getInstance(isAuth: true);

    FormData payload = new FormData.from({
      "grant_type": "password",
      "scope": "openid profile servicointimacoes intimacoesapi",
      "username": codigo,
      "password": senha,
      "office_code": escritorio,
      "client_id": "app_gerenciador",
      "client_secret": "secret"
    });

    return instance.post(url, data: payload);
  }

  static Future<Response> get(String url) async {
    final instance = await _getInstance();
    return instance.get(url);
  }

  static Future<Response> post(String url, Map<String, dynamic> body) async {
    final instance = await _getInstance();
    return instance.post(url, data: body);
  } 

  static Future<Response> put(String url, Map<String, dynamic> body) async {
    final instance = await _getInstance();
    return instance.put(url, data: body);
  } 

  static Future<Response> delete(String url, Map<String, dynamic> body) async {
    final instance = await _getInstance();
    return instance.delete(url);
  } 
}