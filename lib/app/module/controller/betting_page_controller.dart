import 'package:get/get.dart';

class BettingPageController extends GetxController {

  RxBool isSelected = false.obs;
   RxInt selectedIndex = 0.obs;

  BettingPageController();

  void onSelecteNumber(index) {

    selectedIndex.value = index;
 }
}