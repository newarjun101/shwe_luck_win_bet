import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/module/controller/betting_page_controller.dart';

class NumberList extends StatelessWidget {

  final List<String> mNumberList;
  const NumberList({Key? key,required this.mNumberList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bettingPageController = Get.find<BettingPageController>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultMargin.sh),
      child: GridView.builder(
        itemCount: mNumberList.length,
        itemBuilder: (context, index) {
          return Obx(
                ()=> Container(
                decoration: BoxDecoration(
                    color: bettingPageController.selectedIndex.value== index?Theme.of(context).colorScheme.secondary: Color(0xff0F2810).withOpacity(0.9) ,
                    borderRadius: BorderRadius.circular(0.009.sh),
                    border: Border.all(color: Colors.grey.withOpacity(0.8))),
                padding: EdgeInsets.all(0.001.sh),
                child: InkWell(
                  splashColor: Theme.of(context).colorScheme.onPrimary,
                  onTap: () => bettingPageController.onSelecteNumber(index),
                  child: Center(
                    child: Text(
                      mNumberList[index].length <3
                          ? "0${mNumberList[index]}"
                          : mNumberList[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondaryVariant,
                          fontSize: kSmallFontSize12.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          );
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7, crossAxisSpacing: 8, mainAxisSpacing: 8),
      ),
    );
  }
}