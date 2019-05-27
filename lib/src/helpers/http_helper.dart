import 'package:flutter_architecture/src/utils/custom_exception.dart';
import 'dart:io';
import 'package:dio/dio.dart';

class HttpHelper {
  static Dio _client;

  static Dio _openConnetion() {
    if (_client == null) {
      _client = Dio();
      _client.options.contentType = ContentType.parse("application/json");
      return _client;
    }
    return _client;
  }

  static Future<List<Map<String, dynamic>>> list(String url) async {
    _openConnetion();

    _client.options.headers = {
      'Authorization': 'Bearer ...'
    };

    Response res = await _client.get(url)
      .catchError((error) {
        print("HttpHelper.Error:: $error");
        throw new CustomException("HttpHelper:: Erro ao efetuar busca");
      }); 

    return res.data;
  }

  static Future<Map<String, dynamic>> find(String url) async {
    _openConnetion();

    _client.options.headers = {
      'Authorization': 'Bearer ...'
    };

    Response res = await _client.get(url)
      .catchError((error) {
        print("HttpHelper.Error:: $error");
        throw new CustomException("HttpHelper:: Erro ao efetuar busca");
      }); 

    return res.data;
  }

  static Future<Response> post(String url, Map<String, dynamic> body) async {
    _openConnetion();

    _client.options.headers = {
      'Authorization': 'Bearer ...'
    };

    Response res = await _client.post("", data: body)
      .catchError((error) {
        print("HttpHelper.Error:: $error");
        throw new CustomException("HttpHelper:: Erro ao efetuar busca");
      }); 

    return res.data;
  } 
}