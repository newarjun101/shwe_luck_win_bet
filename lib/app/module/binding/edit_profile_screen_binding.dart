import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/module/controller/edit_profile_screen_controller.dart';

class EditProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() => EditProfileScreenController());
  }

}