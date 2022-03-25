import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/module/controller/cash_in_cash_out_screen_controller.dart';


class CashInCashOutScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CashInCashOutScreenController());
  }


}