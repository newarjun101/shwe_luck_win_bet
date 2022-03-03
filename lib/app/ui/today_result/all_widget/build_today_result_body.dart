import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/ui/today_result/all_widget/lottery_result.dart';
import 'package:shwe_luck_win_bet/app/ui/today_result/all_widget/tab_bar_for_user_result.dart';
import 'package:shwe_luck_win_bet/app/ui/today_result/all_widget/user_bet_result.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTodayResultBody extends StatelessWidget {
  const BuildTodayResultBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SizedBox(
            height: 0.4.sh,
            child: const LotteryResult()),

       const  Flexible(child:  TabBarForUserResult())
      ],
    );
  }
}
