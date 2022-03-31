import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/data/model/lottery/tow_d_main_model.dart';
import 'package:shwe_luck_win_bet/app/core/data/repo/lottery/two_d_repo.dart';
import 'package:shwe_luck_win_bet/app/ui/betting_page/all_widget/tow_d_number_list.dart';

import '../../../core/data/model/lottery/two_d_list_model.dart';
import '../../../core/data/service/api_result.dart';
import '../../../core/data/service/status.dart';

class TwoDBettingController extends GetxController {


  late TwoDRepo _twoDRepo;
  RxBool haveLoading = false.obs;
  late int selectedIndex;
  List<TwoDListModel> mTwoDList = [];
  RxBool isSelectedIndex = false.obs;
  bool isThreeDRound = false;
  RxInt odd = 0.obs;
  RxInt price = 100.obs;
  RxBool isError = false.obs;
  RxString errorMessage = "".obs;
  RxBool isErrorBetting = false.obs;
  RxString errorBettingMessage = "".obs;
  RxList<TwoDListModel> mSelectedItem = RxList([]);
  TwoDBettingController(){
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
        print(mTwoDList.length);
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


  getSelectedIndex(index) {
    mTwoDList[index].isSelected = !mTwoDList[index].isSelected;
    if (mTwoDList[index].isSelected == true) {
      mTwoDList[index].defaultAmount = price.value.toString();
      mSelectedItem.add(mTwoDList[index]);
    } else {
      mSelectedItem.remove(mTwoDList[index]);
    }
    checkBySelectedItem();
    update();
  }

  checkBySelectedItem() {
    RxList<TwoDListModel> mmSelected = RxList([]);
    for (int i = 0; i < mTwoDList.length; i++) {
      for (TwoDListModel selectedItem in mSelectedItem) {
        if (mTwoDList[i].id == selectedItem.id) {
          mTwoDList[i].isSelected = true;
          mmSelected.add(selectedItem);
        } else {
          // mTwoDList[i].isSelected = false;
        }
      }
    }
    mSelectedItem.clear();
    mSelectedItem.addAll(mmSelected);
  }



  ///remove item from selected item
  removeSelectedItem() {
    RxList<TwoDListModel> mmSelected = RxList([]);
    for (int i = 0; i < mTwoDList.length; i++) {
      for (TwoDListModel selectedItem in mSelectedItem) {
        if (mTwoDList[i].id == selectedItem.id) {
          //  selectedItem.isSelected = false;
          mTwoDList[i].isSelected = false;
        }
      }
    }
    mSelectedItem.clear();
    update();
  }

  firstNumberGreaterThanOne() {

    String value;
    RxList<TwoDListModel> mmSelected = RxList([]);
    for (int i = 0; i < mTwoDList.length; i++) {

      value = mTwoDList[i].betNumber.toString();


      if(value[0].)
      }
    }
    mSelectedItem.addAll(mmSelected);
  }
}