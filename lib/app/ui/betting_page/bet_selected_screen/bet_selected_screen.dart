import 'package:flutter/material.dart';

import '../../../core/local_ widget/app_bar_with_profile.dart';
import '../bet_selected_screen/widget/build_two_d_bet_selected_screen_body.dart';






class TwoDBetSelectedScreen extends StatelessWidget {


  const TwoDBetSelectedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
     appBar :  AppBarWithProfile(
        profileUrl:
        "https://cdn.pixabay.com/photo/2015/11/30/14/10/batman-1070422_960_720.jpg",
        name: 'Aj MM',
        phone: '096',
        balance: '40000',
        notification: '10',
      ),
      body:BuildTwoDBetSelectedBody(),


    );
  }
}
