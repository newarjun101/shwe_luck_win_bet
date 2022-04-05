import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/module/controller/lotery/two_d_betting_controller.dart';
import 'package:shwe_luck_win_bet/app/ui/bet_selected_screen/widget/custom_data_table_for_selected_bet.dart';
import 'package:shwe_luck_win_bet/app/ui/betting_page/bet_selected_screen/widget/custom_data_table_for_two_d_selected_bet.dart';

class TwoDSelectedBetList extends StatelessWidget {

  final TwoDBettingController controller;
  const TwoDSelectedBetList({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(kDefaultMargin.sh * 2),
        padding: EdgeInsets.all(kDefaultMargin.sh),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(kDefaultMargin.sh)),
        child: ListView(
          children: [
            SizedBox(
              height: kDefaultMargin.sh,
            ),
            Text(
              "",
              style: TextStyle(
                shadows: [
                  Shadow(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      offset: const Offset(0, -20))
                ],
                color: Colors.transparent,
                fontSize: kLargeFontSize16.sp,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Theme.of(context).colorScheme.secondary,
                decorationThickness: 2,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
            SizedBox(
              height: kDefaultMargin.sh,
            ),
            const CustomDataTableForTwoSelectedBet(),
            Divider(
              height: 1,
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(
              height: kDefaultMargin.sh,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Total Price - ",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      fontSize: kSmallFontSize12.sp,
                      fontWeight: FontWeight.bold),
                ),
                Obx(
                    ()=> Text(
                    controller.betTotalAmount.value.toString(),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        fontSize: kLargeFontSize16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
