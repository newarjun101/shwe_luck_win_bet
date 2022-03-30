import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shwe_luck_win_bet/app/core/data/model/lottery/three__d_model.dart';
import 'package:shwe_luck_win_bet/app/core/data/model/lottery/three_d_all_data_model.dart';
import 'package:shwe_luck_win_bet/app/core/data/repo/lottery/three_d_repo.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_result.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/status.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/custom_dialog.dart';
import '../../../core/constants/default_values.dart';
import '../../../core/extension/number_list.dart';

class ThreeDBettingController extends GetxController {
  late ThreeDRepo _threeDRepo;
  RxBool haveLoading = false.obs;
  late int selectedIndex;
  List<ThreeDAllDataModel> mThreeDList = [];
  RxBool isSelectedIndex = false.obs;
  List<String> numberList = threeDNumberGenerate;
  bool isThreeDRound = false;
  RxInt odd = 0.obs;
  RxInt price = 100.obs;
  RxList<ThreeDAllDataModel> mSelectedItem = RxList([]);

  ThreeDBettingController() {
    _threeDRepo = Get.put(ThreeDRepo());
    fetchThreeDList();
  }

  ///Fetch all data from api
  fetchThreeDList() async {
    haveLoading.value = true;
    try {
      ApiResult<ThreeDModel> _result = await _threeDRepo.getThreeD();
      if (_result.status == Status.eCOMPLETED) {
        //  mThreeDList.addAll(_result.mData.threed);
        mThreeDList = _result.mData.threed
            .map((e) => ThreeDAllDataModel(
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
      } else {
        haveLoading.value = false;
      }
    } catch (e) {
      haveLoading.value = false;
    }
    update();
  }

  getSelectedIndex(index) {
    mThreeDList[index].isSelected = !mThreeDList[index].isSelected;

    if (mThreeDList[index].isSelected == true) {
      mSelectedItem.add(mThreeDList[index]);
    } else {
      mSelectedItem.remove(mThreeDList[index]);
    }
    checkBySelectedItem();

    update();
  }

  removeSelectedIndex(ThreeDAllDataModel selectedItem, index) {
    for (int i = 0; i < mThreeDList.length; i++) {
      if (mThreeDList[i].id == selectedItem.id) {
        mThreeDList[i].isSelected = false;
        mSelectedItem.remove(selectedItem);
      }
    }
    update();
  }

  makeR() {
    Set rNum = {};
    List<ThreeDAllDataModel> mTest = [];
    for (int i = 0; i < mSelectedItem.length; i++) {
      List spitNum = mSelectedItem[i].betNumber.toString().split('');
      for (int x = 0; x < spitNum.length; x++) {
        for (int y = 0; y < spitNum.length; y++) {
          for (int z = 0; z < spitNum.length; z++) {
            if (x != y && y != z && z != x) {
              rNum.add("${spitNum[x]}${spitNum[y]}${spitNum[z]}");
            }
          }
        }
      }
    }
    print("haha list $rNum");
    for (int i = 0; i < mThreeDList.length; i++) {
      for (String num in rNum) {
        if (mThreeDList[i].betNumber.toString() == num.toString()) {
          mTest.add(ThreeDAllDataModel(
              id: mThreeDList[i].id,
              betNumber: mThreeDList[i].betNumber,
              hotAmountLimit: mThreeDList[i].hotAmountLimit,
              defaultAmount: mThreeDList[i].defaultAmount,
              subCategoryId: mThreeDList[i].subCategoryId,
              closeNumber: mThreeDList[i].closeNumber,
              currentLimit: mThreeDList[i].currentLimit,
              createdAt: mThreeDList[i].createdAt,
              updatedAt: mThreeDList[i].updatedAt,
              status: mThreeDList[i].status,
              isSelected: true));
        }
      }
    }
    mSelectedItem.clear();
    mSelectedItem.addAll(mTest);
    checkBySelectedItem();

    update();
  }

  bettingThreeD(context) async {
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
      "sub_category": "ထိုင်ဝမ် 2D",
      "section": "3:00 PM",
      "bet_obj": betObject
    };
    customDialog(
        context,
        "Loading",
        SizedBox(
          height: 20,
          width: 20,
          child: Center(child: CircularProgressIndicator()),
        ));
    try {
      ApiResult result = await _threeDRepo.betThreeD(body);
      Get.back();
      print(result.status);
    } catch (e) {
      Get.back();
      print("Hello World");
      // Get.back();
    }
  }


  checkBySelectedItem(){

    RxList<ThreeDAllDataModel> mmSelected = RxList([]);
    for (int i = 0; i < mThreeDList.length; i++) {

      for(ThreeDAllDataModel selectedItem in mSelectedItem) {
        if (mThreeDList[i].id == selectedItem.id) {
        mThreeDList[i].isSelected = true;
        mmSelected.add(selectedItem);
      } else {
          mThreeDList[i].isSelected = false;
        }
      }
    }
    mSelectedItem.clear();
    mSelectedItem.addAll(mmSelected);
  }
}
