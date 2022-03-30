import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/data/model/lottery/three__d_model.dart';
import 'package:shwe_luck_win_bet/app/core/data/model/payment_type_model.dart';

import '../../../constants/api_consts.dart';
import '../../service/api_base_helper.dart';
import '../../service/api_response.dart';
import '../../service/api_result.dart';
import '../../service/status.dart';

class ThreeDRepo {
  late ApiBaseHelper _apiBaseHelper;

  ThreeDRepo() {
    _apiBaseHelper = Get.put(ApiBaseHelper());
  }

  Future<ApiResult<ThreeDModel>> getThreeD() async {
    try {
      ApiResponse response =
          await _apiBaseHelper.getData(rThreeD, isHeader: false);

      ThreeDModel mThreeD = threeDModelFromJson(response.mData);
      if (response.status == Status.eCOMPLETED) {
        return ApiResult(Status.eCOMPLETED, "", mThreeD);
      } else {
        return ApiResult(Status.eERROR, response.message, mThreeD);
      }
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }


  Future<ApiResult<String>> betThreeD(body) async {
    try {
      ApiResponse response =
      await _apiBaseHelper.post(rBetThreeD, body, isHeader: true);

      Map<String, dynamic> mMap = jsonDecode(response.mData);
      if (response.status == Status.eCOMPLETED) {
        return ApiResult(Status.eCOMPLETED, "Success", mMap["message"]);
      } else {
        print('error');
        return ApiResult(Status.eERROR, response.message, "Fail");
      }
    } catch (e) {
      print(e.toString());
      return ApiResult(
        Status.eERROR,
        e.toString(),
        "Fail",
      );
    }
    throw Exception();
  }
}
