import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/ui/today_result/all_widget/lottery_result.dart';
import 'package:shwe_luck_win_bet/app/ui/today_result/all_widget/user_bet_result.dart';

class BuildTodayResultBody extends StatelessWidget {
  const BuildTodayResultBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:const  [

        LotteryResult(),
        Spacer(),
        UserBetResult()
      ],
    );
  }
}
