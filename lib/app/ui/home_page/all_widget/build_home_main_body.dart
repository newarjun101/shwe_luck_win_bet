import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/ui/home_page/core/card_container_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/ui/home_page/core/image_with_border_radius.dart';

class BuildHomeMainBody extends StatelessWidget {
  const BuildHomeMainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
         const ImageWithBorderRadius(imgUrl: "https://cdn.pixabay.com/photo/2021/11/10/18/10/aces-6784543_960_720.jpg",

         ),
          FittedBox(
            child: Row(

              children: [
                CardButtonContainer(onClick: () {  }, isComming: false, title: '2D',),
                CardButtonContainer(onClick: () {  }, isComming: false, title: '3D',),
              ],
            ),
          ),
          FittedBox(
            child: Row(
              children: [

                CardButtonContainer(onClick: () {  }, isComming: true, title: 'ဘောလုံး',),
                CardButtonContainer(onClick: () {  }, isComming: true, title: 'Slots',),
              ],
            ),
          )
        ],
      ),
    );
  }
}
