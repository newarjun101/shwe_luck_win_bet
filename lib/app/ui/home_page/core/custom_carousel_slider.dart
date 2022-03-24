import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/module/controller/home_main_page_controller.dart';

import '../../../core/constants/default_values.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeMainPageController>();
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Obx(
          () => CarouselSlider(
            items: controller.imgList
                .map((image) => Container(
                    width: 0.93.sw,
                    height: 0.45.sw,
                    margin: EdgeInsets.only(
                        top: 2 * kDefaultMargin.sh, bottom: kDefaultMargin.sh),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.5,
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(0.04.sh)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.04.sh),
                        child: Image.network(
                          image,
                          fit: BoxFit.fill,
                        ))))
                .toList(),
            options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                onPageChanged: (index, reason) =>
                    controller.getSliderCurrentIndex(index)),
          ),
        ),
      ],
    );
  }
}
