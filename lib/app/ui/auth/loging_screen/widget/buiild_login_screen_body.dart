import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/loging_screen/widget/build_login_card.dart';

import '../../../../core/constants/default_values.dart';
import '../../../../core/local_ widget/custom_text_form_field.dart';

class BuildLoginScreenBody extends StatelessWidget {
 const  BuildLoginScreenBody({Key? key}) : super(key: key);


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
                  image: const AssetImage('assets/images/bg.png',),
                  colorFilter: ColorFilter.mode(Theme.of(context).primaryColor.withOpacity(0.27),  BlendMode.modulate)
              )
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [



                Image.asset("assets/images/logo.png",height: 100.h,width: 100.h,fit: BoxFit.fill,),
                Text("မြန်မာ 2D/3D",style: TextStyle(color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,fontSize: kMediumFontSize14.sp),),
                BuildLoginCard(),


              ],
            ),
          ),
        ),

        Positioned(
    bottom: 8.h,
            left: 0,right: 0,
            child:   InkWell(
              onTap: ()=> Get.toNamed(Pages.lSignUp),
              child: Text("အကောင့်အသစ်ဖွင့်ရန်",textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,fontSize: kMediumFontSize14.sp),),
            ),
        )
      ],
    );
  }
}
