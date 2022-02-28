import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/ui/profile_page/all_widget/build_profile_main_body.dart';

import '../../core/local_ widget/app_bar_with_profile.dart';

class ProfileMainPage extends StatelessWidget {
  const ProfileMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(


      backgroundColor: Theme.of(context).primaryColor,
      body: const BuildProfileMainBody()
    );
  }
}
