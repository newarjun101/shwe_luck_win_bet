import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/module/controller/sign_up_screen_controller.dart';

class SignUpScreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SignUpScreenController());
  }


}