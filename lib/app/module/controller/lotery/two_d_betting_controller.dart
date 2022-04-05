import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shwe_luck_win_bet/app/core/data/model/lottery/tow_d_main_model.dart';
import 'package:shwe_luck_win_bet/app/core/data/repo/lottery/two_d_repo.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/dialog_child_with_text_form_filed.dart';
import 'package:shwe_luck_win_bet/app/ui/betting_page/all_widget/tow_d_number_list.dart';

import '../../../core/constants/default_values.dart';
import '../../../core/data/model/lottery/two_d_list_model.dart';
import '../../../core/data/service/api_result.dart';
import '../../../core/data/service/status.dart';
import '../../../core/local_ widget/custom_dialog.dart';
import '../../../core/local_ widget/custom_snack_bar.dart';

class TwoDBettingController extends GetxController {
  late TwoDRepo _twoDRepo;
  RxBool haveLoading = false.obs;
  late int selectedIndex;
  List<TwoDListModel> mTwoDList = [];
  RxBool isSelectedIndex = false.obs;
  bool isThreeDRound = false;
  RxInt odd = 0.obs;
  RxInt price = 0.obs;
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxBool isErrorBetting = false.obs;
  RxString errorBettingMessage = "".obs;
  RxList<TwoDListModel> mSelectedItem = RxList([]);
  RxInt customPriceForSelectedItem = 100.obs;
  TextEditingController customPriceText = TextEditingController();
  RxInt betTotalAmount = 0.obs;

  TwoDBettingController() {
    _twoDRepo = Get.put(TwoDRepo());
    fetchThreeDList();
  }

  fetchThreeDList() async {
    haveLoading.value = true;
    try {
      ApiResult<TwoDMainModel> _result = await _twoDRepo.getThreeD();
      if (_result.status == Status.eCOMPLETED) {
        //  mThreeDList.addAll(_result.mData.threed);
        mTwoDList = _result.mData.twoD
            .map((e) => TwoDListModel(
                id: e.id,
                betNumber: e.betNumber,
                hotAmountLimit: e.hotAmountLimit,
                defaultAmount: e.defaultAmount,
                subCategoryId: e.subCategoryId,
                closeNumber: e.closeNumber,
                currentLimit: e.currentLimit,
                createdAt: e.createdAt,
                updatedAt: e.updatedAt,
                status: e.status,
                isSelected: false))
            .toList();
        odd.value = int.parse(_result.mData.odd);
        haveLoading.value = false;
        isError.value = false;
      } else {
        print("ereror");
        haveLoading.value = false;
        errorMessage.value = _result.errorMessage;
        isError.value = true;
      }
    } catch (e) {
      print(e.toString());
      haveLoading.value = false;
      isError.value = true;
      errorMessage.value = e.toString();
    }
    update();
  }

  removeSelectedIndex(TwoDListModel selectedItem, index) {
    for (int i = 0; i < mTwoDList.length; i++) {
      if (mTwoDList[i].id == selectedItem.id) {
        mTwoDList[i].isSelected = false;
        mSelectedItem.remove(selectedItem);
      }
    }
    countBettingTotalPrice();
    update();
  }

  editPrice(TwoDListModel selectedItem, index, context) {
    customDialog(
        context,
        "Update Value",
        DialogChildWithTextFormField(
            textController: customPriceText,
            hint: "hint",
            buttonText: "Update",
            onPress: () {
              RxString bill = customPriceText.text.obs;
              selectedItem.defaultAmount = bill.value;
              mSelectedItem.refresh();
              countBettingTotalPrice();
              Get.back();
            }));
  }

  ///count total price
  countBettingTotalPrice() {
    betTotalAmount.value = 0;
    for (int index = 0; index < mSelectedItem.length; index++) {
      double value = double.parse(mSelectedItem[index].defaultAmount);
      betTotalAmount.value += value.toInt();
    }
    print(betTotalAmount);
  }

  ///round 3 d
  makeR() {
    Set rNum = {};
    List<TwoDListModel> mTest = [];
    String makeR; // Music 𝄞 for the win
    for (int i = 0; i < mSelectedItem.length; i++) {
      rNum.add(mSelectedItem[i].betNumber);
      makeR = mSelectedItem[i].betNumber.split('').reversed.join();
      rNum.add(makeR);
    }
    for (int i = 0; i < mTwoDList.length; i++) {
      for (String num in rNum) {
        if (mTwoDList[i].betNumber.toString() == num.toString() &&
            mTwoDList[i].isSelected != true) {
          mTwoDList[i].isSelected = true;
          mTest.add(mTwoDList[i]);
        }
      }
    }
    // mSelectedItem.clear();
    mSelectedItem.addAll(mTest);
    //  checkBySelectedItem();
    update();
  }

  clearAllSelectedItem() {
    for (int index = 0; index < mTwoDList.length; index++) {
      if (mTwoDList[index].isSelected == true) {
        mSelectedItem.remove(mTwoDList[index]);
        mTwoDList[index].isSelected = false;
      }
    }
    countBettingTotalPrice();
    update();
  }

  getSelectedIndex(index) {
    mTwoDList[index].isSelected = !mTwoDList[index].isSelected;
    print(mTwoDList[index].isSelected);
    if (mTwoDList[index].isSelected == true) {
      //  mTwoDList[index].defaultAmount = price.value.toString();
      mSelectedItem.add(mTwoDList[index]);
    } else {
      mSelectedItem.remove(TwoDListModel(
          id: mTwoDList[index].id,
          betNumber: mTwoDList[index].betNumber,
          hotAmountLimit:
              (double.parse(mTwoDList[index].hotAmountLimit).toInt())
                  .toString(),
          defaultAmount: mTwoDList[index].defaultAmount,
          subCategoryId: mTwoDList[index].subCategoryId,
          closeNumber: mTwoDList[index].closeNumber,
          currentLimit: mTwoDList[index].currentLimit,
          createdAt: mTwoDList[index].createdAt,
          updatedAt: mTwoDList[index].updatedAt,
          status: mTwoDList[index].status,
          isSelected: true));
    }
    checkBySelectedItem();
    countBettingTotalPrice();
    update();
  }

  checkBySelectedItem() {
    RxList<TwoDListModel> mmSelected = RxList([]);
    for (int i = 0; i < mTwoDList.length; i++) {
      for (TwoDListModel selectedItem in mSelectedItem) {
        if (mTwoDList[i].id == selectedItem.id &&
            mTwoDList[i].isSelected == true) {
          mTwoDList[i].isSelected = true;
          mmSelected.add(selectedItem);
        }
      }
    }

    mSelectedItem.clear();
    mSelectedItem.addAll(mmSelected);
    countBettingTotalPrice();
    update();
  }

  ///remove item from selected item
  removeSelectedItem() {
    //  RxList<TwoDListModel> mmSelected = RxList([]);
    for (int i = 0; i < mTwoDList.length; i++) {
      for (TwoDListModel selectedItem in mSelectedItem) {
        if (mTwoDList[i].id == selectedItem.id) {
          mTwoDList[i].isSelected = false;
        }
      }
    }
    mSelectedItem.clear();
    countBettingTotalPrice();
    update();
  }

  oddNumber() {
    //  removeSelectedItem();
    RxList<TwoDListModel> mmSelected = RxList([]);
    for (int i = 0; i < mTwoDList.length; i++) {
      if (int.parse(mTwoDList[i].betNumber) % 2 != 0 &&
          mTwoDList[i].isSelected == false) {
        mTwoDList[i].isSelected = true;
        mmSelected.add(mTwoDList[i]);
      }
    }
    mSelectedItem.addAll(mmSelected);
//    checkBySelectedItem();
    update();
  }

  evenNumber() {
    RxList<TwoDListModel> mmSelected = RxList([]);
    for (int i = 0; i < mTwoDList.length; i++) {
      if (int.parse(mTwoDList[i].betNumber) % 2 == 0 &&
          mTwoDList[i].isSelected == false) {
        mTwoDList[i].isSelected = true;
        mmSelected.add(mTwoDList[i]);
      }
    }
    mSelectedItem.addAll(mmSelected);
    update();
  }

  bothEven() {
    String value;
    RxList<TwoDListModel> mmSelected = RxList([]);
    for (int i = 0; i < mTwoDList.length; i++) {
      value = mTwoDList[i].betNumber.toString();
      if (int.parse(value[0]) % 2 == 0 &&
          int.parse(value[1]) % 2 == 0 &&
          mTwoDList[i].isSelected == false) {
        mTwoDList[i].isSelected = true;
        mmSelected.add(mTwoDList[i]);
      }
    }
    mSelectedItem.addAll(mmSelected);
    update();
  }

  bothOdd() {
    String value;
    RxList<TwoDListModel> mmSelected = RxList([]);
    for (int i = 0; i < mTwoDList.length; i++) {
      value = mTwoDList[i].betNumber.toString();
      if (int.parse(value[0]) % 2 != 0 &&
          int.parse(value[1]) % 2 != 0 &&
          mTwoDList[i].isSelected == false) {
        mTwoDList[i].isSelected = true;
        mmSelected.add(mTwoDList[i]);
      }
    }
    mSelectedItem.addAll(mmSelected);
    update();
  }

  firstEvenSecondOdd() {
    String value;
    RxList<TwoDListModel> mmSelected = RxList([]);
    for (int i = 0; i < mTwoDList.length; i++) {
      value = mTwoDList[i].betNumber.toString();
      if (int.parse(value[0]) % 2 == 0 &&
          int.parse(value[1]) % 2 != 0 &&
          mTwoDList[i].isSelected == false) {
        mTwoDList[i].isSelected = true;
        mmSelected.add(mTwoDList[i]);
      }
    }
    mSelectedItem.addAll(mmSelected);
    update();
  }

  firstOddSecondEven() {
    ///  removeSelectedItem();
    String value;
    RxList<TwoDListModel> mmSelected = RxList([]);
    for (int i = 0; i < mTwoDList.length; i++) {
      value = mTwoDList[i].betNumber.toString();
      if (int.parse(value[0]) % 2 != 0 &&
          int.parse(value[1]) % 2 == 0 &&
          mTwoDList[i].isSelected == false) {
        mTwoDList[i].isSelected = true;
        mmSelected.add(mTwoDList[i]);
      }
    }
    mSelectedItem.addAll(mmSelected);
    update();
  }

  bothSameValue() {
    //  removeSelectedItem();
    String value;
    RxList<TwoDListModel> mmSelected = RxList([]);
    for (int i = 0; i < mTwoDList.length; i++) {
      value = mTwoDList[i].betNumber.toString();
      if (value[0] == value[1] && mTwoDList[i].isSelected == false) {
        mTwoDList[i].isSelected = true;
        mmSelected.add(mTwoDList[i]);
      }
    }
    mSelectedItem.addAll(mmSelected);
    update();
  }

  getByNumber({required String digit, bool? isFirstStart}) {
    // removeSelectedItem();
    String value;
    RxList<TwoDListModel> mmSelected = RxList([]);
    for (int i = 0; i < mTwoDList.length; i++) {
      value = mTwoDList[i].betNumber.toString();
      if (isFirstStart ?? false
          ? digit == value[0]
          : digit == value[1] && mTwoDList[i].isSelected == false) {
        mTwoDList[i].isSelected = true;
        mmSelected.add(mTwoDList[i]);
      }
    }
    mSelectedItem.addAll(mmSelected);
    update();
  }

  selectByLength({required int startLength, required int endLength}) {
    //  removeSelectedItem();
    String value;
    RxList<TwoDListModel> mmSelected = RxList([]);
    for (int i = startLength; i <= endLength; i++) {
      if (mTwoDList[i].isSelected == false) {
        mTwoDList[i].isSelected = true;
        mmSelected.add(mTwoDList[i]);
      }
    }
    mSelectedItem.addAll(mmSelected);
    update();
  }

  ///3d htoe meee
  bettingTwoD(context) async {
    List<Map> betObject = mSelectedItem
        .map((data) => {
              "bet_id": data.id,
              "bet_number": data.betNumber,
              "amount": price.value,
              "odd": odd.value,
              "sub_category_id": data.subCategoryId,
              "section": "16:00:00"
            })
        .toList();
    Map<String, dynamic> body = {
      "user_id": GetStorage().read(USER_ID),
      "sub_category": "ထိုင်း 2D",
      "section": "3:00 PM",
      "bet_obj": betObject
    };
    customDialog(
        context,
        "Loading",
        const SizedBox(
          height: 20,
          width: 20,
          child: Center(child: CircularProgressIndicator()),
        ));
    try {
      ApiResult result = await _twoDRepo.betTowD(body);
      if (result.status == Status.eCOMPLETED) {
        Get.back();
        debugPrint("no error");
        betTotalAmount.value = 0;
        removeSelectedItem();
        customSnackBar(
            title: "Betting Successful",
            icon: Icons.check_circle,
            snackPosition: SnackPosition.BOTTOM,
            bgColor: Colors.white,
            iconColor: Colors.white);
      } else {
        Get.back();
        customSnackBar(
            title: "Betting Fail",
            icon: Icons.check_circle,
            snackPosition: SnackPosition.BOTTOM,
            bgColor: Colors.white,
            iconColor: Colors.white);
      }
    } catch (e) {
      Get.back();
      // Get.back();
      customSnackBar(
          title: "Betting fail Something gone wrong with server",
          icon: Icons.check_circle,
          snackPosition: SnackPosition.BOTTOM,
          bgColor: Colors.white,
          iconColor: Colors.white);
    }
  }
}
