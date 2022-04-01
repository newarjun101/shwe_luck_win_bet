import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shwe_luck_win_bet/app/core/constants/api_consts.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/core/data/model/auth/login_response_model.dart';
import 'package:shwe_luck_win_bet/app/core/data/repo/auth_repo.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_result.dart';
import 'package:http/http.dart' as http;
import 'package:shwe_luck_win_bet/app/core/local_%20widget/custom_dialog.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';

import '../../core/data/service/status.dart';

class LoginScreenController extends GetxController {
  late AuthRepo _authRepo;
  final box = GetStorage();
  final RxBool isLoginSuccess = false.obs;
  final RxBool isLoginError = true.obs;
  final RxString errorMessage = RxString("");

  LoginScreenController() {
    _authRepo = AuthRepo();
  }

  Future<void> login(
      {required String phone,
      required String password,
      required context}) async {
    Map body = {"phone": phone, "password": password};

    try {
      customDialog(context, "Please Wait",const SizedBox( height: 35,width: 20,child: Center(child: const CircularProgressIndicator())));
      isLoginError.value = true;
      isLoginSuccess.value = false;
      ApiResult<LoginResponseModel> result = await _authRepo.login(body);
      print(result.mData.message);
      if (result.status == Status.eCOMPLETED) {
        isLoginError.value = false;
        isLoginSuccess.value = true;
        errorMessage.value = "";
        box.write(TOKEN,result.mData.token);
        box.write(USER_ID,result.mData.data?.userId);
        Get.back();
        print("login success");
    //    Get.offAndToNamed(Pages.lINITIAL);
      } else {
        Get.back();
        isLoginError.value = true;
        isLoginSuccess.value = false;
        print( result.mData.message);
        errorMessage.value = result.mData.message;
      }
    } catch (e) {
      Get.back();
      isLoginSuccess.value = false;
      isLoginError.value = true;
      errorMessage.value = e.toString();
    }
  }
}
