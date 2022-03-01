import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/module/controller/login_screen_controller.dart';

class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoginScreenController());
  }


}