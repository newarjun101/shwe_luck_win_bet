import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/constants/api_consts.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_base_helper.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_response.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_result.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/status.dart';

import '../model/auth/login_response_model.dart';

class AuthRepo {
  late LoginResponseModel _model = LoginResponseModel(result: -1, message: 'error', status: -1);
  late ApiBaseHelper _apiBaseHelper;

  AuthRepo() {
    _apiBaseHelper = Get.put(ApiBaseHelper());
  }

  ///will use for login
  Future<ApiResult<LoginResponseModel>> login(body) async {
    try {
      ApiResponse response = await _apiBaseHelper.post(LOGIN, body);

      LoginResponseModel model = loginResponseModelFromJson(response.mData);
      if (response.status == Status.eCOMPLETED) {
        return ApiResult(Status.eCOMPLETED, "Success",model);
      } else {
        return ApiResult(Status.eERROR,response.message,model);
      }
    } catch (e) {
      return ApiResult(Status.eERROR, e.toString(), _model,);
    }
    throw Exception();
  }

/*  Future<ApiResult<LoginResponseModel>> signUp(body) async {
    try {
      dynamic response = await _apiBaseHelper.post(LOGIN, body);
      Map<String, dynamic> mMap = jsonDecode(response.body);
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
  }*/
}
