import 'package:shwe_luck_win_bet/app/core/data/service/status.dart';

class ApiResponse {
  late Status status; // to handle status is completed or not
  late dynamic data ; // the result data will be stored here
  late String message; // the response full message will be stored here

  ApiResponse.completed(this.data) : status = Status.eCOMPLETED;
  ApiResponse.error(this.message) : status = Status.eERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
