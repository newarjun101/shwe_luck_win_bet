import 'package:get/get.dart';

class HomeMainPageController extends  GetxController {

  RxInt currentIndex = 0.obs;
 RxList imgList =RxList([
   "https://cdn.pixabay.com/photo/2021/11/10/18/10/aces-6784543_960_720.jpg",
   "https://cdn.pixabay.com/photo/2021/11/10/18/10/aces-6784543_960_720.jpg",
   "https://cdn.pixabay.com/photo/2021/11/10/18/10/aces-6784543_960_720.jpg",
   "https://cdn.pixabay.com/photo/2021/11/10/18/10/aces-6784543_960_720.jpg",
   "https://cdn.pixabay.com/photo/2021/11/10/18/10/aces-6784543_960_720.jpg",
   "https://cdn.pixabay.com/photo/2021/11/10/18/10/aces-6784543_960_720.jpg",
 ]);
  HomeMainPageController();


  void getSliderCurrentIndex(index) {
    currentIndex.value = index;
  }


  void getTimeSelectedIndex(index) {

    print(index);
  }
}
