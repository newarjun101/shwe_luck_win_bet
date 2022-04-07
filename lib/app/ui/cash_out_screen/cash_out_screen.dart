import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/ui/cash_out_screen/widget/build_cash_out_screen_body.dart';

import '../../core/local_ widget/app_bar_with_profile.dart';

class CashOutScreen extends StatelessWidget {
  const CashOutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
        appBar: const AppBarWithProfile(
          profileUrl:
          "https://cdn.pixabay.com/photo/2015/11/30/14/10/batman-1070422_960_720.jpg",
          name: 'Aj MM',
          phone: '096',
          balance: '40000',
          notification: '10',
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: const AssetImage('assets/images/bg.png',),
                      colorFilter: ColorFilter.mode(Theme.of(context).primaryColor.withOpacity(0.27),  BlendMode.modulate)
                  )
              ),
            ),
            BuildCashOutScreenBody()
        ],
      )
    );
  }
}
