import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/constants/api_consts.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_base_helper.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_response.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_result.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/status.dart';

import '../model/auth/login_response_model.dart';
import '../model/auth/profile_model.dart';

class AuthRepo {
  final LoginResponseModel _model =
      LoginResponseModel(result: -1, message: 'error', status: -1);
  late ApiBaseHelper _apiBaseHelper;

  AuthRepo() {
    _apiBaseHelper = Get.put(ApiBaseHelper());
  }

  ///will use for login
  Future<ApiResult<LoginResponseModel>> login(body) async {
    try {
      ApiResponse response =
          await _apiBaseHelper.post(zLogin, body, isHeader: false);

      LoginResponseModel model = loginResponseModelFromJson(response.mData);
      if (model.status == 200) {
        return ApiResult(Status.eCOMPLETED, "Success", model);
      } else {
        return ApiResult(Status.eERROR, model.message, model);
      }
    } catch (e) {
      return ApiResult(
        Status.eERROR,
        e.toString(),
        _model,
      );
    }
  }

  Future<ApiResult<ProfileModel>> getProfile() async {
    try {
      ApiResponse response =
          await _apiBaseHelper.getData(zProfile, isHeader: true);
      Map mMap = jsonDecode(response.mData);
      ProfileModel model = profileModelFromJson(jsonEncode(mMap["data"]));

      if (response.status == Status.eCOMPLETED) {
        return ApiResult(Status.eCOMPLETED, "", model);
      } else {
        print("error on else");
        return ApiResult(Status.eERROR, response.message, model);
      }
    } catch (e) {
      debugPrint("catch error on Paymetn Repo ${e.toString()}");
      return ApiResult(
          Status.eERROR,
          e.toString(),
          ProfileModel(
              profileImage: "",
              name: '',
              userCode: '',
              refeeralCode: null,
              id: -1,
              phone: '',
              balance: ''));
    }
  }

  ///will use to request otp
  Future<ApiResult<dynamic>> optRequestResponse({apiRoute, body}) async {
    try {
      ApiResponse response =
          await _apiBaseHelper.post(apiRoute, body, isHeader: false);
      var data = jsonDecode(response.mData);
      print(data);


      if (data["success"] == true) {
        return ApiResult(Status.eCOMPLETED, "Success", data);
      } else {
        return ApiResult(Status.eERROR, response.message,  data);
      }
    } catch (e) {
      return ApiResult(
        Status.eERROR,
        e.toString(),
       e.toString()
      );
    }
    throw Exception();
  }

///to register user data after phone and otp confirm
  Future<ApiResult<dynamic>> userDataRegister(body) async {
    try {
      ApiResponse response =
      await _apiBaseHelper.post(zLogin, body, isHeader: false);
      LoginResponseModel model = loginResponseModelFromJson(response.mData);
      if (response.status == Status.eCOMPLETED) {
        return ApiResult(Status.eCOMPLETED, "Success", model);
      } else {
        return ApiResult(Status.eERROR, response.message, model);
      }
    } catch (e) {
      return ApiResult(
        Status.eERROR,
        e.toString(),
        _model,
      );
    }
    throw Exception();
  }
}
