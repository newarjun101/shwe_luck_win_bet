import 'dart:convert';

import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/data/model/lottery/tow_d_main_model.dart';
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

  Future<ApiResult<TwoDMainModel>> getThreeD() async {
    try {
      ApiResponse response =
          await _apiBaseHelper.getData(zTwoD, isHeader: false);
      TwoDMainModel mTwoD = twoDMainModelFromJson(response.mData);
      if (response.status == Status.eCOMPLETED) {
        return ApiResult(Status.eCOMPLETED, "", mTwoD);
      } else {
        return ApiResult(Status.eERROR, response.message, mTwoD);
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<ApiResult<String>> betTowD(body) async {
    try {
      ApiResponse response =
          await _apiBaseHelper.post(zBetThreeD, body, isHeader: true);
      Map<String, dynamic> mMap = jsonDecode(response.mData);
      if (response.status == Status.eCOMPLETED) {
        return ApiResult(Status.eCOMPLETED, "Success", mMap["message"]);
      } else {
        return ApiResult(Status.eERROR, response.message, "Fail");
      }
    } catch (e) {
      return ApiResult(
        Status.eERROR,
        e.toString(),
        "Fail",
      );
    }
    throw Exception();
  }
}
