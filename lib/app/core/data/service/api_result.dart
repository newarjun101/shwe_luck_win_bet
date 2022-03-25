import 'package:shwe_luck_win_bet/app/core/data/service/status.dart';

class ApiResult<T> {
  Status status;
  String errorMessage;
  T mData;

  ApiResult(this.status, this.errorMessage, this.mData);

}