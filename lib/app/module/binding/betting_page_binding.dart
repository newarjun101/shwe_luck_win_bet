import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/module/controller/betting_page.dart';

class BettingPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BettingPageController());
  }
}
