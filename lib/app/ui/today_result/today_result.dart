import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/custom_time_selection_botton.dart';
import 'package:shwe_luck_win_bet/app/ui/today_result/all_widget/build_today_result_body.dart';
import '../../core/local_ widget/app_bar_with_profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../module/controller/feature_main_controller.dart';

class TodayResult extends StatelessWidget {
  const TodayResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FeatureMainController mFeatureController =
        Get.find<FeatureMainController>();
    return ScreenUtilInit(builder: () {
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
            const Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: BuildTodayResultBody())
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          elevation: 8,
          onPressed: () {  Get.bottomSheet(CustomTimeSelectionButton(controller: mFeatureController, onPress: ()=> print("hello world")),isDismissible: true);},
          child: Text(
            "ထိုးမယ်",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primaryVariant,
                fontWeight: FontWeight.bold),
          ),
        ),
        // bottomNavigationBar: BuildButtomNavbarFeature(
        //   featureMainController: mFeatureController,
        // ),
      );
    });
  }
}
