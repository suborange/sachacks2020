import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:lean_provider/core/constants/api_key.dart';

class HttpService {
  Dio _dio = Dio();
  final baseUrl =
      'https://api.us-south.tone-analyzer.watson.cloud.ibm.com/instances/c2f43c14-b067-40af-bb1c-5a5d768846ce';

  void init() {
    _dio.options.baseUrl = baseUrl;

    print("initializing the http service");
  }

  Future<dynamic> getHttp(String route, Map<String, dynamic> params) async {
    Response response;
    params["version"] = "2017-09-21";
    try {
      response = await _dio.get(
        route,
        queryParameters: params,
        options: getAuthOptions(),
      );
    } catch (e) {
      print(e);
    }
    final data = decodeResponseBodyToJson(response.data);
    return data;
  }

  Options getAuthOptions() {
    String username = ApiKey.username;
    String password = ApiKey.key;
    String basicAuth = "Basic " +
        convert.base64Encode(convert.utf8.encode('$username:$password'));
    return Options(headers: <String, String>{'authorization': basicAuth});
  }

  Map<String, dynamic> decodeResponseBodyToJson(dynamic body) {
    final data = Map<String, dynamic>.from(body);
    return data;
  }
}
