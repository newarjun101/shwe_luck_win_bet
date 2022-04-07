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
    print("calling");
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

  Future<dynamic> post(uri, body, {bool? isHeader}) async {
    try {
      // ,headers: getHeader()
      var url = Uri.parse(baseUrl + uri);
      http.Response response = await http.post(url,
          headers: isHeader ??false ? getHeaderWithToken() : getHeader(),
          body: jsonEncode(body));
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

/*  Future<dynamic> postWithImageFile(uri,body) {
    var request = http.MultipartRequest("POST", Uri.parse(baseURL + 'register'));
    request.fields['name'] = name;
    request.fields['phone'] = phone;
    request.fields['password'] = password;
    if(profileImage != null){
      request.files.add(await http.MultipartFile.fromPath(
        'profile_image', profileImage.path,
        filename: name,
      ));
  }
  }*/
  initData() {
    baseUrl = "$zBaseUrl";
  }
}
