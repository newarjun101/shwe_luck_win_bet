import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/testing_app/controller/test_local_controller.dart';

class TestLocalBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() => TestLocalController());

//    Get.put(TestLocalController());
  }


}