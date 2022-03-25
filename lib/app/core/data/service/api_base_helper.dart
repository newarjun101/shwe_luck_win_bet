import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shwe_luck_win_bet/app/core/constants/api_consts.dart';

import 'app_exception.dart';


class ApiBaseHelper {
  String _baseUrl = BASE_URL; // initialize api url

  ApiBaseHelper() {
    //apibase helper
  }

  ApiBaseHelper.setCustomURL({required String baseUrl}) {
    _baseUrl = baseUrl;
  }

  // get method for api call
  Future<dynamic> get(String uri) async {
    dynamic responseJson;
    try {
      var url = Uri.parse(_baseUrl + uri);
      final response = await http.get(url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getWithHeader(String uri,Map<String,String> headerValue) async{
    dynamic responseJson;
    try {
      var url = Uri.parse(_baseUrl + uri);
      final response = await http.get(url,headers: headerValue);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // get method for api call
  Future<dynamic> post(String uri, var body) async {
    dynamic responseJson;
    try {
      var url = Uri.parse(_baseUrl + uri);
      final response =
      await http.post(url,headers : getHeader(),body: jsonEncode(body));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // handing different response
  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 201:
        var responseJson = response.body;
        return responseJson;
      case 400:
        throw BadRequestException(response.body);
      case 401:
      case 403:
        throw UnauthorisedException(response.body);
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  ///submit example
  //await http.post(url, headers: getHeader(), body: jsonEncode(body));

  // handing with header
  dynamic getHeader() {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }
}