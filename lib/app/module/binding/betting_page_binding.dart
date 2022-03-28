import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/module/controller/betting_page_controller.dart';
import 'package:shwe_luck_win_bet/app/module/controller/profile_screen_controller.dart';

import '../controller/feature_main_controller.dart';

class BettingPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BettingPageController());
    Get.lazyPut(() => FeatureMainController());
  }
}
