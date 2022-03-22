import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/module/controller/home_main_page_controller.dart';

class HomeMainPageBindig extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeMainPageController());
  }

}