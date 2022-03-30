import 'dart:collection';

import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/data/model/lottery/three__d_model.dart';
import 'package:shwe_luck_win_bet/app/core/data/model/lottery/three_d_all_data_model.dart';
import 'package:shwe_luck_win_bet/app/core/data/repo/lottery/three_d_repo.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_result.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/status.dart';

import '../../../core/extension/number_list.dart';

class ThreeDBettingController extends GetxController {
  late ThreeDRepo _threeDRepo;
  RxBool haveLoading = false.obs;
  late int selectedIndex;
  List<ThreeDAllDataModel> mThreeDList = [];
  RxBool isSelectedIndex = false.obs;
  List<String> numberList = threeDNumberGenerate;
  RxBool isThreeDRound = false.obs;

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

        print(mThreeDList);
        haveLoading.value = false;
      } else {
        haveLoading.value = false;
      }
    } catch (e) {
      haveLoading.value = false;
      print(e.toString());
    }
    update();
  }

  getSelectedIndex(index) {
    RxBool test = mThreeDList[index].isSelected.obs;
    mThreeDList[index].isSelected = !mThreeDList[index].isSelected;
    print(mThreeDList[index].isSelected);

    if (mThreeDList[index].isSelected == true) {
      mSelectedItem.add(mThreeDList[index]);
    } else {
      mSelectedItem.remove(mThreeDList[index]);
    }
    update();
  }

  removeSelectedIndex(ThreeDAllDataModel selectedItem, index) {
    makeR();
    int a = 123;

    for (int i = 0; i < mThreeDList.length; i++) {
      if (mThreeDList[i] == selectedItem) {
        mThreeDList[i].isSelected = false;
        // mSelectedItem.remove(index);
      }
    }
    mSelectedItem.remove(selectedItem);
    update();
  }

  makeR() {

    Set rNum = {};
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
    mSelectedItem.clear();
    for (int i = 0; i < mThreeDList.length; i++) {
      for (String num in rNum) {
        if (mThreeDList[i].betNumber.toString() == num) {
          print(mThreeDList[i].id);
          //mSelectedItem.add(mThreeDList[i]);
        }
      }
    }
  }
}
