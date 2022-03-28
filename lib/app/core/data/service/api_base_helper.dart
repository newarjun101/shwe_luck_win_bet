/*
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

  Future<dynamic> getWithHeader(
      String uri, Map<String, String> headerValue) async {
    dynamic responseJson;
    try {
      var url = Uri.parse(_baseUrl + uri);
      final response = await http.get(url, headers: headerValue);
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
          await http.post(url, headers: getHeader(), body: jsonEncode(body));
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
        print("200");
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
     // "Accept": "application/json",
    };
  }
}
*/
import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shwe_luck_win_bet/app/core/constants/api_consts.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_response.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_result.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/status.dart';

/**
 * We wil use this class for the http services sucs as Get,post,delete ,etc.
 */
class ApiBaseHelper {
  late String baseUrl;

  ApiBaseHelper() {
    initData();
  }

  Future<dynamic> getData(uri, {bool? isHeader}) async {
    try {
      // ,headers: getHeader()
      var url = Uri.parse(baseUrl + uri);
      http.Response response = await http.get(url,
          headers: isHeader ?? false ? getHeaderWithToken() : getHeader());
      if (response.statusCode == 200) {
        return ApiResponse(Status.eCOMPLETED, "", response.body);
      } else {
        return ApiResponse(Status.eERROR, "", response.body);
      }
    } on FormatException catch (_) {
      return ApiResponse(Status.eERROR, "", "");
    } on SocketException catch (_) {
      return ApiResponse(Status.eERROR, "", "");
    } catch (e) {
      return ApiResponse(Status.eERROR, "", "");
    }
  }

  Future<dynamic> post(uri, body, {required bool isHeader}) async {
    try {
      // ,headers: getHeader()
      var url = Uri.parse(baseUrl + uri);
      http.Response response = await http.post(url,
          headers: isHeader ? getHeaderWithToken() : getHeader(),
          body: jsonEncode(body));
      print(response.body);
      if (response.statusCode == 200) {
        print("no error");
        return ApiResponse(Status.eCOMPLETED, "", response.body);
      } else {
        return ApiResponse(
            Status.eERROR, response.statusCode.toString(), response.body);
      }
    } on FormatException catch (_) {
      return ApiResponse(Status.eERROR, "", "");
    } on SocketException catch (_) {
      return ApiResponse(Status.eERROR, "", "");
    } catch (e) {
      return ApiResponse(Status.eERROR, "", "");
    }
  }

  dynamic getHeader() {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }

  dynamic getHeaderWithToken() {
    return {
      'Authorization': 'Bearer ${GetStorage().read(TOKEN)}',
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }

  initData() {
    baseUrl = "$BASE_URL";
  }
}
