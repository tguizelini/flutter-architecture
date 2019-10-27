import 'package:flutter_architecture/src/helpers/storage/storage_helper.dart';
import 'package:flutter_architecture/src/helpers/storage/storage_keys.dart';
import 'package:dio/dio.dart';

class HttpHelper {
  static Dio _client;

  static Future<Dio> _getInstance({ bool isAuth, bool withCookie ,bool withToken}) async {
    final storageToken = await StorageHelper.get(StorageKeys.token);
    final storageCookie = await StorageHelper.get(StorageKeys.cookie);

    if (_client == null) _client = Dio();

    if (isAuth == true) {
      _client.options.headers = { "Content-Type": "x-www-form-urlencoded" };
      return _client;
    }

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $storageToken'
    };

    if(withToken == true)
      headers = {
        ...headers,
        'Bearer': '$storageToken' 
      };

    if (withCookie == true)
      headers = {
        ...headers,
        'Cookie': '$storageCookie'
      };
    
    _client.options.headers = headers;
    return _client;
  }

  static Future<Response> get(String url, { bool withCookie ,bool withToken}) async {
    final instance = await _getInstance(withCookie: withCookie,withToken: withToken);
    return instance.get(url);
  }

  static Future<Response> post(String url, { dynamic body, bool withToken, bool withCookie }) async {
    final instance = await _getInstance(withCookie: true, withToken: true);
    return instance.post(url, data: body);
  } 

  static Future<Response> put(String url, { dynamic body, bool withToken, bool withCookie }) async {
    final instance = await _getInstance(withCookie: withCookie,withToken: withToken);
    return instance.put(url, data: body);
  } 

  static Future<Response> delete(String url, { dynamic body, bool withToken, bool withCookie }) async {
    final instance = await _getInstance(withCookie: withCookie,withToken: withToken);
    return instance.delete(url);
  } 
}