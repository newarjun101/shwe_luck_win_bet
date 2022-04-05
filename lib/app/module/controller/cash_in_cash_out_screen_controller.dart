import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/custom_buttom_sheet.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/custom_snack_bar.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/payment_type_list_widget.dart';

import '../../core/data/model/payment_type_model.dart';
import '../../core/data/repo/payment_repo.dart';
import '../../core/data/service/api_result.dart';
import '../../core/data/service/status.dart';
import '../../core/local_ widget/custom_dialog.dart';

class CashInCashOutScreenController extends GetxController {
  late PaymentRepo _paymentRepo;
  RxList<PaymentTypeModel> mPaymentList = RxList([]);
  late int mSelectedPaymentIndex = -1;
  RxBool isPaymentSelected = false.obs;
  RxBool haveLoading = false.obs;
  RxString errorMessage = RxString("");

  showPaymentTypeWidget(context) {
    Future.delayed(const Duration(milliseconds: 100), () {
      customBottomSheet(
          context: context, child: const PaymentTypeListWidget(), height: 0.31);
    });
  }

  getAllPayment() async {
    haveLoading.value = true;
    try {
      ApiResult<List<PaymentTypeModel>> result =
          await _paymentRepo.getPaymentType();
      if (result.status == Status.eCOMPLETED) {
        debugPrint(result.mData.length.toString());
        mPaymentList.value = result.mData;
        haveLoading.value = false;
        errorMessage.value = "Success";
      } else {
        haveLoading.value = false;
        errorMessage.value = result.errorMessage;
      }
    } catch (e) {
      haveLoading.value = false;
      errorMessage.value = "Error On Payment Request";
      print("catch erron on cash in cahs out controller");
    }
  }

  selectPaymentType(index) {
    mSelectedPaymentIndex = index;
    isPaymentSelected.value = true;
    Get.back();
    debugPrint(index.toString());
  }

  cashInRequest(
      {required context,
      required String name,
      required int transitionId,
      required int amount,
      required String phone}) async {
    Map test = {
      "user_id": GetStorage().read(USER_ID),
      "payment_id": mSelectedPaymentIndex,
      "account_name": name,
      "transaction_id": transitionId,
      "amount": amount,
      "user_phone": phone
    };
    customDialog(
        context, "Loading", const Center(child: CircularProgressIndicator()));
    haveLoading = true.obs;
    try {
      ApiResult result = await _paymentRepo.cashInRequest(test);
      if (result.status == Status.eCOMPLETED) {
        haveLoading.value = false;
        errorMessage.value = "Success";
        Get.back();
        customSnackBar(
            title: "Payment Successful",
            icon: Icons.check_circle,
            snackPosition: SnackPosition.BOTTOM,
            bgColor: Colors.white,
            iconColor: Colors.white);
      } else {
        Get.back();
        haveLoading.value = false;
        errorMessage.value = result.errorMessage;
        haveLoading.value = false;
        customSnackBar(
            title: "Error on Payment",
            icon: Icons.check_circle,
            snackPosition: SnackPosition.BOTTOM,
            bgColor: Colors.white,
            iconColor: Colors.white);
      }
    } catch (e) {
      Get.back();
      haveLoading.value = false;
      errorMessage.value = "Something wrong with Server";
      customSnackBar(
          title: "Error on Payment",
          icon: Icons.check_circle,
          snackPosition: SnackPosition.BOTTOM,
          bgColor: Colors.white,
          iconColor: Colors.white);
      debugPrint(e.toString());
    }
  }

  cashOutRequest(
      {required context,
      required String name,
      required int amount,
      required String phone}) async {
    Map body = {
      "user_id": GetStorage().read(USER_ID),
      "payment_id": mSelectedPaymentIndex,
      "account_name": name,
      "amount": amount,
      "user_phone": phone
    };
    customDialog(
        context,
        "Loading",
        const Center(
            child: SizedBox(
                width: 20, height: 20, child: CircularProgressIndicator())));
    haveLoading = true.obs;
    try {
      ApiResult result = await _paymentRepo.cashOutRequest(body);
      if (result.status == Status.eCOMPLETED) {
        haveLoading.value = false;
        Get.back();
        errorMessage.value = "Success";
        customSnackBar(
            title: "Payment Request Successful",
            icon: Icons.check_circle,
            snackPosition: SnackPosition.BOTTOM,
            bgColor: Colors.white,
            iconColor: Colors.white);

      } else {
        Get.back();
        haveLoading.value = false;
        errorMessage.value = result.errorMessage;
        Get.back();
        customSnackBar(
            title: "Error on Payment",
            icon: Icons.check_circle,
            snackPosition: SnackPosition.BOTTOM,
            bgColor: Colors.white,
            iconColor: Colors.white);
      }
    } catch (e) {
      Get.back();
      haveLoading.value = false;
      errorMessage.value = "Something wrong with Server";
      Get.back();
      customSnackBar(
          title: "Error on Payment",
          icon: Icons.check_circle,
          snackPosition: SnackPosition.BOTTOM,
          bgColor: Colors.white,
          iconColor: Colors.white);
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    _paymentRepo = Get.put(PaymentRepo());
    getAllPayment();
    super.onInit();
  }
}
