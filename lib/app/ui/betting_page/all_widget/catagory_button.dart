import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';
import 'package:shwe_luck_win_bet/app/ui/betting_page/all_widget/quick_betting_bottom_sheet.dart';

import '../../../core/constants/default_values.dart';
import '../../../core/local_ widget/custom_button.dart';
import '../../../core/local_ widget/custom_text_form_field.dart';
import '../../../core/validation/validation.dart';

class CatagoryButton extends StatelessWidget {
  const CatagoryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    return Container(
      width: 1.sh,
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultMargin.sh, vertical: 0.015.sh),
      color: Theme.of(context).primaryColor,
      child: FittedBox(
        child: Row(
          children: [
            CustomButton(
              textColor: Theme.of(context).colorScheme.onPrimary,
              title: '0 - 100',
              bgColor: Theme.of(context).colorScheme.primaryVariant,
              onClick: () {

                Get.toNamed(Pages.lOffDay);
              },
              radius: 0.01.sw,
              icon: Icons.keyboard_arrow_down_rounded,
              iconSize: kLargeFontSize16.sp,
              isIcon: true,
            ),
            const SizedBox(
              width: 4,
            ),
            CustomButton(
              textColor: Theme.of(context).colorScheme.onPrimary,
              title: 'Quick',
              bgColor: Theme.of(context).colorScheme.primaryVariant,
              onClick: () {

                quickBettingBottomSheet(context);
              },
              radius: 0.01.sw,
              iconSize: kLargeFontSize16.sp,
              isIcon: false,
            ),
            const SizedBox(
              width: 4,
            ),
            CustomButton(
              textColor: Theme.of(context).colorScheme.secondaryVariant,
              title: 'R',
              bgColor: Colors.green,
              onClick: () {},
              radius: 0.01.sw,
              icon: Icons.paid,
              iconSize: kLargeFontSize16.sp,
              isIcon: false,
            ),
            const SizedBox(
              width: 4,
            ),
           SizedBox(
             width: 0.33.sw,
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
            const SizedBox(
              width: 4,
            ),
            CustomButton(
              textColor: Theme.of(context).colorScheme.onPrimary,
              title: 'ထိုးမည်',
              bgColor: Theme.of(context).colorScheme.secondary,
              onClick: () {},
              radius: 0.01.sw,
              iconSize: kLargeFontSize16.sp,
              isIcon: false,
            ),
          ],
        ),
      ),
    );
  }
}
