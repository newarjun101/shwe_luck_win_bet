import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/ui/betting_page/all_widget/number_list.dart';



class BuildBettingPageBody extends StatelessWidget {
  const BuildBettingPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // alignment: Alignment.center,
      children: const[

       SizedBox(height: 12),
          NumberList(),
        SizedBox(height: 12,)

      ],
    );
  }
}
