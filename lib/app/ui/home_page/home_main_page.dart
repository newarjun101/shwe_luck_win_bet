import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/app_bar_with_profile.dart';
import 'package:shwe_luck_win_bet/app/ui/home_page/all_widget/build_home_main_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: () {
      return Scaffold(
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
              CachedNetworkImage(
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                imageUrl:
                    "https://i.pinimg.com/474x/0d/17/56/0d17567b3f5abae1c5add00b1f61bf5d.jpg",
              ),
              const BuildHomeMainBody(),
            ],
          ));
    });
  }
}
