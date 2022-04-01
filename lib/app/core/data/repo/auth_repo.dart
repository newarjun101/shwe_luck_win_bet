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
  Future<ApiResult<String>> optRequestResponse({apiRoute, body}) async {
    try {
      ApiResponse response =
          await _apiBaseHelper.post(apiRoute, body, isHeader: false);
      print(response.mData);

      if (response.status == Status.eCOMPLETED) {
        return ApiResult(Status.eCOMPLETED, "Success", jsonEncode(response.mData));
      } else {
        return ApiResult(Status.eERROR, response.message,  jsonEncode(response.mData));
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
