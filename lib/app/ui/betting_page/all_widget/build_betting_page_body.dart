import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/ui/betting_page/all_widget/catagory_button.dart';
import 'package:shwe_luck_win_bet/app/ui/betting_page/all_widget/number_list.dart';



class BuildBettingPageBody extends StatelessWidget {
  const BuildBettingPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CatagoryButton(),
        Flexible(
            child: Stack(
          // alignment: Alignment.center,
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              imageUrl:
                  "https://i.pinimg.com/474x/0d/17/56/0d17567b3f5abae1c5add00b1f61bf5d.jpg",
            ),

               const NumberList(),

          ],
        ))
      ],
    );
  }
}
