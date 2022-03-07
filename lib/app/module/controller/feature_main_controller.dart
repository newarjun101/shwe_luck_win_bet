import 'package:get/get.dart';

class FeatureMainController extends GetxController {

  late RxInt currentIndex;

  FeatureMainController() {
    currentIndex = 0.obs;
  }

  changeIndex(int index) {
    currentIndex.value = index;
  }

  int getIndex() {
    return currentIndex.value;
  }

  //cart controller

  @override
  void onInit() {
    super.onInit();
  }

  RxList<String> mRouteHistory = RxList();

  RxString startRoute = RxString("");

  RxBool clearAppbar = RxBool(false);

  pushNewRoutesHistory() {
    mRouteHistory.add("first");
  }
}