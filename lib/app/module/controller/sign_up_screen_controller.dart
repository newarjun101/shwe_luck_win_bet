

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
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


  SignUpScreenController () {
    _authRepo = AuthRepo();
  }

  final _picker = ImagePicker();
 getFromGallery() async {
  final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
  if (pickedImage != null) {
    imageFile = File(pickedImage.path);
   update();
  }
 }

  callOtp() {
   isOtp.value = true;
  }

  Future<void> getOtp(
      {required String phone,
        required context}) async {
    Map body = {"phone": phone};

    try {
      customDialog(context, "Loading", Text("Loading"));
      isLoginError.value = true;
      isLoginSuccess.value = false;
      ApiResult result = await _authRepo.opt(body);
      if (result.status == Status.eCOMPLETED) {
        isLoginError.value = false;
        isLoginSuccess.value = true;
        errorMessage.value = "";
        Get.back();
        print("login success");
        Get.offAndToNamed(Pages.lSignUp);
      } else {
        Get.back();
        print("login else error ${result.errorMessage}");
        isLoginError.value = true;
        isLoginSuccess.value = false;
        errorMessage.value = result.errorMessage;
      }
    } catch (e) {
      Get.back();
      print("error catch ${e.toString()}");
      isLoginSuccess.value = false;
      isLoginError.value = true;
      errorMessage.value = e.toString();
    }
  }
}