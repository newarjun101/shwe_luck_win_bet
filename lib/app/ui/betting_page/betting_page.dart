import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/custom_button.dart';
import 'package:shwe_luck_win_bet/app/ui/betting_page/all_widget/build_betting_page_body.dart';

import '../../core/local_ widget/app_bar_with_profile.dart';

class BettingPage extends StatelessWidget {
  const BettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => Scaffold(
        appBar: const AppBarWithProfile(
          profileUrl:
              "https://cdn.pixabay.com/photo/2015/11/30/14/10/batman-1070422_960_720.jpg",
          name: 'Aj MM',
          phone: '096',
          balance: '40000',
          notification: '10',
        ),
        body: const BuildBettingPageBody(),
        floatingActionButton: SizedBox(
          width: 0.3.sw,
          child: CustomButton(
            isIcon: false,
            title: 'နောက်ထပ်',
            radius: 0.1.sw,
            bgColor: Theme.of(context).colorScheme.secondary,
            onClick: () {},
            iconSize: 0,
            textColor: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
