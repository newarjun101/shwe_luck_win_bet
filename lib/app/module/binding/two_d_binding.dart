import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/module/controller/feature_main_controller.dart';
import 'package:shwe_luck_win_bet/app/module/controller/lotery/two_d_betting_controller.dart';

class TwoDBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() => TwoDBettingController());
    Get.lazyPut(() => FeatureMainController());
  }

}