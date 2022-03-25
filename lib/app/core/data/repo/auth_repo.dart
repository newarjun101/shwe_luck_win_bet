import 'dart:convert';

import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/constants/api_consts.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_base_helper.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_response.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_result.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/status.dart';

import '../model/auth/login_response_model.dart';

class AuthRepo {
  late ApiBaseHelper _apiBaseHelper;

  AuthRepo() {
    _apiBaseHelper = Get.put(ApiBaseHelper());
  }


  ///will use for login
  Future<ApiResult<LoginResponseModel>> login(body) async {
    try {
      dynamic response = await _apiBaseHelper.post(LOGIN, body);
      Map<String, dynamic> mMap = jsonDecode(response.body);
      LoginResponseModel _model = loginResponseModelFromJson(response.body);
      if (response.status == 200) {
        return ApiResult(Status.eCOMPLETED, "Success", _model);
      } else {
        return ApiResult(Status.eCOMPLETED, mMap["message"], _model);
      }
    } catch (e) {
      return ApiResult(Status.eERROR, e.toString(),
          LoginResponseModel(status: -1, message: '', result: -1));
    }
    throw Exception();
  }


  Future<ApiResult<LoginResponseModel>> signUp(body) async {
    try {
      dynamic response = await _apiBaseHelper.post(LOGIN, body);
      Map<String, dynamic> mMap = jsonDecode(response.body);
      LoginResponseModel _model = loginResponseModelFromJson(response.body);
      if (response.status == 200) {
        return ApiResult(Status.eCOMPLETED, "Success", _model);
      } else {
        return ApiResult(Status.eCOMPLETED, mMap["message"], _model);
      }
    } catch (e) {
      return ApiResult(Status.eERROR, e.toString(),
          LoginResponseModel(status: -1, message: '', result: -1));
    }
    throw Exception();
  }
}
