import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/ui/help_center_page/widget/build_help_center_main_body.dart';

import '../../core/local_ widget/app_bar_with_profile.dart';

class HelpCenterMainPage extends StatelessWidget {
  const HelpCenterMainPage({Key? key}) : super(key: key);

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
      body:const BuildHelpCenerBody(),
    );
  }
}
