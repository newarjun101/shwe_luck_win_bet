import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/custom_carousel_slider.dart';

class BuildHomeMainBody extends StatelessWidget {
  const BuildHomeMainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomCarouselSlider(),
          /* const ImageWithBorderRadius(
            imgUrl:
                "https://cdn.pixabay.com/photo/2021/11/10/18/10/aces-6784543_960_720.jpg",
          ),*/
          FittedBox(
            child: Row(
              children: [
                GestureDetector(
                  onTap : ()=> Get.toNamed(Pages.lBetting),
                  child: Image.asset(
                    "assets/images/two_d.jpg",
                    width: 0.45.sw,
                    height: 0.2.sh,
                    fit: BoxFit.contain,
                  ),
                ),
                GestureDetector(
                  onTap : ()=> Get.toNamed(Pages.lThreeDBetting),
                  child: Image.asset(
                    "assets/images/three_d.jpg",
                    width: 0.45.sw,
                    height: 0.2.sh,
                    fit: BoxFit.contain,
                  ),
                )

                /*           CardButtonContainer(
                  onClick: () {
                    Get.toNamed(Pages.lThreeDBetting);
                  },
                  isComming: false,
                  title: '3D',
                ),*/
              ],
            ),
          ),
          SizedBox(
            height: kDefaultMargin.sh,
          ),
          FittedBox(
            child: Row(
              children: [
                Image.asset(
                  "assets/images/football.jpg",
                  width: 0.45.sw,
                  height: 0.2.sh,
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  "assets/images/football.jpg",
                  width: 0.45.sw,
                  height: 0.2.sh,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
