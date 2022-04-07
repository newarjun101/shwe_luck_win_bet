import 'package:get/get.dart';
import '../controller/feature_main_controller.dart';

class BettingPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => FeatureMainController());
  }
}
