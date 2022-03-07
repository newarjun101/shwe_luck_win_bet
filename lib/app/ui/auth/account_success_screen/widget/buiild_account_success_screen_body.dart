import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/loging_screen/widget/build_login_card.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/otp_screen/widget/build_otp_card.dart';

import '../../../../core/constants/default_values.dart';
import '../../../../core/local_ widget/custom_text_form_field.dart';

class BuildAccountSuccessScreenBody extends StatelessWidget {
  const BuildAccountSuccessScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.8),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: const AssetImage(
                    'assets/images/bg.png',
                  ),
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).primaryColor.withOpacity(0.27),
                      BlendMode.modulate))),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                // Image.asset("assets/images/logo.png",height: 100.h,width: 100.h,fit: BoxFit.fill,),
                Container(
                    decoration: const BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                    child: Padding(
                      padding: EdgeInsets.all(0.03.sh),
                      child: Icon(
                        Icons.check,
                        size: 50.sp,
                        color: Colors.white,
                      ),
                    )),
                SizedBox(
                  height: kDefaultMargin.sh,
                ),
                Text(
                  "အကောင့်အသစ်ဖွင့်ချင်အောင်မြင်ပါသည်",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: kMediumFontSize14.sp),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16.h,
          left: 26.w,
          right: 26.w,
          child: MaterialButton(
            minWidth: double.infinity,
            height: 0.068.sh,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.h)),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              Get.offNamed(Pages.lINITIAL);
            },
            child: Text(
              "ဆက်သွားမယ်",
              style: TextStyle(
                  //     color: Theme.of(context).colorScheme.primaryContainer,
                  fontSize: kLargeFontSize16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
