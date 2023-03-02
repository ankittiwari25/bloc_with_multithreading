import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static ApiService? _instance;

  ApiService._privateConstructor();

  static ApiService get instance {
    _instance ??= ApiService._privateConstructor();
    return _instance!;
  }

  Future<dynamic> get(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      return _returnResponse(response);
    } on SocketException {
      throw "No Connection...";
    }
  }

  dynamic _returnResponse(http.Response response) {
    if (json.decode(utf8.decode(response.bodyBytes)).runtimeType == List<dynamic>) {
      return json.decode(utf8.decode(response.bodyBytes));
    }
    Map<String, dynamic> responseJson = json.decode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return responseJson;
    } else {
      debugPrint('''
      =============================
      API ERROR
      URL: ${response.request!.url.toString()}
      Status Code: ${response.statusCode}, Message: ${responseJson['message']}
      =============================''');
    }
  }
}
