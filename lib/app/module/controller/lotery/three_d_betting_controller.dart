import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/data/model/lottery/three__d_model.dart';
import 'package:shwe_luck_win_bet/app/core/data/repo/lottery/three_d_repo.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_result.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/status.dart';

class ThreeDBettingController extends GetxController {
  late ThreeDRepo _threeDRepo;
  RxBool haveLoading = false.obs;

  late RxInt selectedIndex;

  RxList<Threed> mThreeDList = RxList([]);

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
        mThreeDList.addAll(_result.mData.threed);
        haveLoading.value = false;
        print(mThreeDList);
      } else {
        haveLoading.value = false;
      }
    } catch (e) {
      haveLoading.value = false;
      print(e.toString());
    }
  }

  getSelectedIndex(index) {
    selectedIndex.value = index;
  }
}
