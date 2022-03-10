import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/ui/balance_page/balance_screen.dart';
import 'package:shwe_luck_win_bet/app/ui/betting_page/betting_page.dart';
import 'package:shwe_luck_win_bet/app/ui/feature_main/build_buttom_navbar_feature.dart';
import 'package:shwe_luck_win_bet/app/ui/help_center_page/help_center_main_page.dart';
import 'package:shwe_luck_win_bet/app/ui/home_page/home_main_page.dart';
import 'package:shwe_luck_win_bet/app/ui/profile_page/profile_main_page.dart';
import 'package:shwe_luck_win_bet/app/ui/today_result/today_result.dart';

import '../../module/controller/feature_main_controller.dart';

class FeatureMain extends StatelessWidget {
  const FeatureMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FeatureMainController mFeatureController =
        Get.find<FeatureMainController>();
    return Obx(() => Scaffold(
          body: IndexedStack(
            children: const [
              HomeMainPage(),
             BalanceScreen(),
              BettingPage(),
              ProfileMainPage()
            ],
            index: mFeatureController.currentIndex.value,
          ),
          bottomNavigationBar: BuildButtomNavbarFeature(
            featureMainController: mFeatureController,
          ),
        ));
  }
}
