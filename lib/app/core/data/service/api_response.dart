import 'package:shwe_luck_win_bet/app/core/data/service/status.dart';

class ApiResponse {
  late Status status; // to handle status is completed or not
  late dynamic mData ; // the result data will be stored here
  late String message;

  ApiResponse(this.status,
      this.message,this.mData); // the response full message will be stored here

  /*ApiResponse.completed(this.data) : status = Status.eCOMPLETED;
  ApiResponse.error(this.message) : status = Status.eERROR;*/


}
