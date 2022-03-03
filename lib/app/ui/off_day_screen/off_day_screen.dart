import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/ui/off_day_screen/widget/build_off_day_screen_body.dart';

import '../../core/local_ widget/app_bar_with_profile.dart';

class OffDayScreen extends StatelessWidget {
  const OffDayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  AppBarWithProfile(
        profileUrl:
        "https://cdn.pixabay.com/photo/2015/11/30/14/10/batman-1070422_960_720.jpg",
        name: 'Aj MM',
        phone: '096',
        balance: '40000',
        notification: '10',
      ),
      body: BuildOffDayScreenBody(),
    );
  }
}
