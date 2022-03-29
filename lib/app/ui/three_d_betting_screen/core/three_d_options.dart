import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';
import 'package:shwe_luck_win_bet/app/module/controller/lotery/three_d_betting_controller.dart';

import '../../../core/constants/default_values.dart';
import '../../../core/local_ widget/custom_button.dart';
import '../../../core/local_ widget/custom_text_form_field.dart';
import '../../../core/validation/validation.dart';
import '../../betting_page/all_widget/quick_betting_bottom_sheet.dart';

class ThreeDOptions extends StatelessWidget {
  const ThreeDOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThreeDBettingController>();
    TextEditingController passwordController = TextEditingController();
    return Container(
      width: 1.sh,
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultMargin.sh, vertical: 0.015.sh),
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          CustomButton(
            textColor: Theme.of(context).colorScheme.onPrimary,
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
            child: SizedBox(
              height: 0.056.sh,
              child: CustomTextFormField(
                  controller: passwordController,
                  icon: Icons.paid,
                  hint: "3000",
                  bgColor: Theme.of(context).colorScheme.primaryContainer,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  validator: checkIsEmpty,
                  isPassword: false),
            ),

            /*CustomButton(
              textColor: Theme.of(context).colorScheme.onPrimary,
              title: '30000',
              bgColor: Theme.of(context).colorScheme.primaryVariant,
              onClick: () {

                Get.toNamed(Pages.lBalancePage);
              },
              radius: 0.01.sw,
              iconSize: kLargeFontSize16.sp,
              isIcon: true,
            ),*/
          ),
          const SizedBox(
            width: 4,
          ),
          Stack(
            children: [
              CustomButton(
                textColor: Theme.of(context).colorScheme.onPrimary,
                title: 'ထိုးမည်',
                bgColor: Theme.of(context).colorScheme.secondary,
                onClick: () {
                  Get.toNamed(Pages.lBetSelected);
                },
                radius: 0.01.sw,
                iconSize: kLargeFontSize16.sp,
                isIcon: false,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: CircleAvatar(
                  radius: 10.h,
                    backgroundColor: Colors.red,
                    child: Obx(() => Text(
                          controller.mSelectedItem.length.toString(),
                          style: TextStyle(color: Theme.of(context).colorScheme.primaryContainer,fontSize:kSmallFontSize12.sp),
                        ))),
              )
            ],
          ),
        ],
      ),
    );
  }
}
