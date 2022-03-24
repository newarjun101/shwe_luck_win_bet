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
                CardButtonContainer(
                  onClick: () => Get.toNamed(Pages.lBetting),
                  isComming: false,
                  title: '2D',
                ),
                CardButtonContainer(
                  onClick: () {
                    Get.toNamed(Pages.lThreeDBetting);
                  },
                  isComming: false,
                  title: '3D',
                ),
              ],
            ),
          ),
          FittedBox(
            child: Row(
              children: [
                CardButtonContainer(
                  onClick: () { showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return customDialog(
                          context, "Football", const Center(child: Text("Comming Soon")));
                    },
                  );},
                  isComming: true,
                  title: 'ဘောလုံး',
                ),
                CardButtonContainer(
                  onClick: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return customDialog(
                            context, "Slot", const Center(child: Text("Comming Soon")));
                      },
                    );
                  },
                  isComming: true,
                  title: 'Slots',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
