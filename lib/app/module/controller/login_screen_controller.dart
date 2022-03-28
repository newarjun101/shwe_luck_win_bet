import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shwe_luck_win_bet/app/core/constants/api_consts.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/core/data/model/auth/login_response_model.dart';
import 'package:shwe_luck_win_bet/app/core/data/repo/auth_repo.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_result.dart';
import 'package:http/http.dart' as http;
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

  /* login() async {

    http.Response res = await http.post(
        Uri.parse(BASE_URL + "login"),
        headers: {"Content-Type" : "application/json"},
        body: jsonEncode(<String, dynamic>{"phone":09788216, "password":password})
    );
  }*/
  Future<void> login({required String phone, required String password}) async {
    Map body = {"phone": phone, "password": password};

    try {
      isLoginError.value = true;
      isLoginSuccess.value = false;
      ApiResult<LoginResponseModel> result = await _authRepo.login(body);
      if (result.status == Status.eCOMPLETED) {
        isLoginError.value = false;
        print("no error on login");
        isLoginSuccess.value = true;
        errorMessage.value = "";
        box.write(TOKEN, result.mData.token.toString());
        Get.offAndToNamed(Pages.lINITIAL);
      } else {
        print(result.mData.message);
        isLoginError.value = true;
        isLoginSuccess.value = false;
        errorMessage.value = result.errorMessage;
      }
    } catch (e) {
      print("error catch");
      isLoginSuccess.value = false;
      isLoginError.value = true;
      errorMessage.value = e.toString();
    }
  }
}
