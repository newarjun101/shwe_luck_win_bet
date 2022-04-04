import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shwe_luck_win_bet/app/core/constants/api_consts.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/status.dart';

import '../../core/data/repo/auth_repo.dart';
import '../../core/data/service/api_result.dart';
import '../../core/local_ widget/custom_dialog.dart';
import '../../core/route/pages.dart';

class SignUpScreenController extends GetxController {
  File? imageFile;

  late AuthRepo _authRepo;
  final box = GetStorage();
  final RxBool isLoginSuccess = false.obs;
  final RxBool isLoginError = true.obs;
  final RxString errorMessage = RxString("");
  RxBool isOtp = false.obs;
  String mPhone = "";

  SignUpScreenController() {
    _authRepo = AuthRepo();
  }

  final _picker = ImagePicker();

  getFromGallery() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
      update();
    }
  }

  ///to get otp
  Future<void> getOtp({required String phone, required context}) async {
    mPhone = phone;
    Map body = {"phone": phone};

    try {
      customDialog(
          context,
          "Please Wait",
          const SizedBox(
              height: 35,
              width: 20,
              child: Center(child: CircularProgressIndicator())));
      isLoginError.value = true;
      isLoginSuccess.value = false;

      ApiResult result =
          await _authRepo.optRequestResponse(apiRoute: zOtpRequest, body: body);
      if (result.status == Status.eCOMPLETED) {
        isLoginError.value = false;
        isLoginSuccess.value = true;
        isOtp.value = true;
        errorMessage.value = "";
        isOtp.value = true;

        Get.back();
        print("login success");
        //     Get.offAndToNamed(Pages.lSignUp);
      } else {
        Get.back();
        print("login else error ${result.errorMessage}");
        print(result.mData["message"]);
        isLoginError.value = true;
        isLoginSuccess.value = false;
        isOtp.value = false;
        errorMessage.value = result.mData["message"];
      }
    } catch (e) {
      Get.back();
      print("error catch ${e.toString()}");
      isLoginSuccess.value = false;
      isLoginError.value = true;
      isOtp.value = true;
      errorMessage.value = e.toString();
    }
  }

  /// to confirm opt
  Future<void> confirmOtp({required String otpCode, required context}) async {
    Map body = {"code": otpCode};

    try {
      customDialog(
          context,
          "Please Wait",
          const SizedBox(
              height: 35,
              width: 20,
              child: Center(child: CircularProgressIndicator())));
      isLoginError.value = true;
      isLoginSuccess.value = false;
      ApiResult result =
          await _authRepo.optRequestResponse(apiRoute: zOtpVerify, body: body);
      if (result.status == Status.eCOMPLETED) {
        isLoginError.value = false;
        isLoginSuccess.value = true;
        errorMessage.value = "";
        Get.back();
        Get.toNamed(Pages.lSignUp);
        //  Get.offAndToNamed(Pages.lSignUp);
      } else {
        Get.back();
        isLoginError.value = true;
        isLoginSuccess.value = false;
        errorMessage.value = result.mData["message"] ?? "";
        print(result.mData["message"]);
      }
    } catch (e) {
      Get.back();
      isLoginSuccess.value = false;
      isLoginError.value = true;
      errorMessage.value = "Error With Server";
    }
  }

  /// to confirm opt
  Future<void> registerConfirm(
      {required String password,
      required String name,
      required context}) async {
    Map body = {
      "name": name,
      "phone": mPhone,
      "password": password,
      "profile_image": ""
    };
    print(body);
    try {
      customDialog(
          context,
          "Please Wait",
          const SizedBox(
              height: 35,
              width: 20,
              child: Center(child: CircularProgressIndicator())));
      isLoginError.value = true;
      isLoginSuccess.value = false;
      ApiResult result =
          await _authRepo.optRequestResponse(apiRoute: zRegister, body: body);
      if (result.status == Status.eCOMPLETED) {
        isLoginError.value = false;
        isLoginSuccess.value = true;
        Get.offAndToNamed(Pages.lLoginScreen);
        errorMessage.value = "";
        Get.back();
        print("login success");
        //  Get.offAndToNamed(Pages.lSignUp);
      } else {
        Get.back();
        print("login else error ${result.errorMessage}");
        isLoginError.value = true;
        isLoginSuccess.value = false;
        errorMessage.value = result.mData["message"] ?? "";
      }
    } catch (e) {
      /// Get.back();
      print("error catch ${e.toString()}");
      isLoginSuccess.value = false;
      isLoginError.value = true;
      errorMessage.value = e.toString();
    }
  }
}
