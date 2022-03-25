import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/custom_dialog.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';
import 'package:shwe_luck_win_bet/app/ui/home_page/core/card_container_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/ui/home_page/core/image_with_border_radius.dart';

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
                Image.asset(
                  "assets/images/two_d.jpg",
                  width: 0.45.sw,
                  height: 0.2.sh,
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  "assets/images/three_d.jpg",
                  width: 0.45.sw,
                  height: 0.2.sh,
                  fit: BoxFit.contain,
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
             /*   CardButtonContainer(
                  onClick: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return customDialog(context, "Slot",
                            const Center(child: Text("Comming Soon")));
                      },
                    );
                  },
                  isComming: true,
                  title: 'Slots',
                ),*/
              ],
            ),
          )
        ],
      ),
    );
  }
}
