import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/constants/api_consts.dart';
import 'package:shwe_luck_win_bet/app/core/data/repo/auth_repo.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_result.dart';
import 'package:http/http.dart'as http;

class LoginScreenController extends GetxController {
  late AuthRepo _authRepo;

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
  Future<void> login({required String phone,required String password}) async {
    Map body = {"phone": phone, "password": password};
    ApiResult result = await _authRepo.login(body);
    if (kDebugMode) {
      print(result.errorMessage);
    }
  }
}
