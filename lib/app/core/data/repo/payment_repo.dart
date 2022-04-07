import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/constants/api_consts.dart';
import 'package:shwe_luck_win_bet/app/core/data/model/payment_type_model.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/api_result.dart';
import 'package:shwe_luck_win_bet/app/core/data/service/status.dart';

import '../service/api_base_helper.dart';
import '../service/api_response.dart';

class PaymentRepo {
  late ApiBaseHelper _apiBaseHelper;

  PaymentRepo() {
    _apiBaseHelper = Get.put(ApiBaseHelper());
  }

  ///get all payment type
  Future<ApiResult<List<PaymentTypeModel>>> getPaymentType() async {
    try {
      ApiResponse response = await _apiBaseHelper.getData(zPaymentMethod);
      List<PaymentTypeModel> mType = paymentTypeModelFromJson(response.mData);
      if (response.status == Status.eCOMPLETED) {
        return ApiResult(Status.eCOMPLETED, "", mType);
      } else {
        return ApiResult(Status.eERROR, response.message, mType);
      }
    } catch (e) {
      debugPrint("catch error on Paymetn Repo");
      return ApiResult(Status.eERROR, e.toString(), []);
    }
  }

  ///request cash in
  Future<ApiResult<String>> cashInRequest(body) async {
    try {
      ApiResponse response =
          await _apiBaseHelper.post(zCashIn, body, isHeader: true);

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

  Future<ApiResult<String>> cashOutRequest(body) async {
    try {
      ApiResponse response =
          await _apiBaseHelper.post(zCashOut, body, isHeader: true);

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
