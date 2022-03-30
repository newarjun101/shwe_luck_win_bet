import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_base_helper.dart';
import 'package:shwe_luck_win_bet/app/ui/betting_page/all_widget/tow_d_number_list.dart';

import '../../../constants/api_consts.dart';
import '../../model/lottery/three__d_model.dart';
import '../../service/api_response.dart';
import '../../service/api_result.dart';
import '../../service/status.dart';

class TwoDRepo {
 late ApiBaseHelper _apiBaseHelper;

  TwoDRepo() {

    _apiBaseHelper = Get.put(ApiBaseHelper());
  }

  Future<ApiResult<ThreeDModel>> getThreeD() async {
    try {
      ApiResponse response =
      await _apiBaseHelper.getData(rTwoD, isHeader: false);
      ThreeDModel mThreeD = threeDModelFromJson(response.mData);
      if (response.status == Status.eCOMPLETED) {
        print(mThreeD);
        return ApiResult(Status.eCOMPLETED, "", mThreeD);
      } else {
        print("error");
        return ApiResult(Status.eERROR, response.message, mThreeD);
      }
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }
}