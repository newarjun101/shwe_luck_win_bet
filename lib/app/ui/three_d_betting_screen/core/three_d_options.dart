import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';

import '../../../core/constants/default_values.dart';
import '../../../core/local_ widget/custom_button.dart';
import '../../betting_page/all_widget/quick_betting_bottom_sheet.dart';

class ThreeDOptions extends StatelessWidget {
  const ThreeDOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sh,
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultMargin.sh, vertical: 0.015.sh),
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [

          CustomButton(
            textColor: Theme.of(context).colorScheme.secondaryVariant,
            title: 'R',
            bgColor: Colors.green,
            onClick: () {},
            radius: 0.01.sw,
            icon: Icons.paid,
            iconSize: kMediumFontSize14.sp,
            isIcon: false,
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: CustomButton(
              textColor: Theme.of(context).colorScheme.onPrimary,
              title: '30000',
              bgColor: Theme.of(context).colorScheme.primaryVariant,
              onClick: () {

                Get.toNamed(Pages.lBalancePage);
              },
              radius: 0.01.sw,
              iconSize: kLargeFontSize16.sp,
              isIcon: true,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          CustomButton(
            textColor: Theme.of(context).colorScheme.onPrimary,
            title: 'ထိုးမည်',
            bgColor: Theme.of(context).colorScheme.secondary,
            onClick: () {  Get.toNamed(Pages.lBetSelected);},
            radius: 0.01.sw,
            iconSize: kLargeFontSize16.sp,
            isIcon: false,
          ),
        ],
      ),
    );
  }
}