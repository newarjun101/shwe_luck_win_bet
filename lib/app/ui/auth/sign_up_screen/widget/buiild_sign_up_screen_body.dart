import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/loging_screen/widget/build_login_card.dart';
import 'package:shwe_luck_win_bet/app/ui/auth/sign_up_screen/widget/build_sign_up_card.dart';

import '../../../../core/constants/default_values.dart';
import '../../../../core/local_ widget/custom_text_form_field.dart';
import '../../../../module/controller/sign_up_screen_controller.dart';

class BuildSignUpScreenBody extends StatelessWidget {
  const BuildSignUpScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpController = Get.find<SignUpScreenController>();
    return GetBuilder<SignUpScreenController>(
      builder: (controller) {
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

                 /*   GestureDetector(
                      onTap: ()=> controller.getFromGallery(),
                      child: CircleAvatar(
                        radius: 60.h,

                        backgroundColor: Theme.of(context).primaryColor,
                        child: Center(
                          child: signUpController.imageFile==null? Icon(
                            Icons.add_a_photo_outlined,size: 50.sp,
                            color: Theme.of(context).colorScheme.secondary,
                          ) : CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              radius: 60.h,
                              backgroundImage: FileImage(signUpController.imageFile!))
                        )
                      ),
                    ),*/


                    Text(
                      "အကောင့်အသစ်ဖွင့်ရန်",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primaryContainer,
                        //  fontWeight: FontWeight.bold,
                          fontSize: kMediumFontSize14.sp),
                    ),
                    BuildSignUpCard(),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 8.h,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: ()=> Get.offNamed(Pages.lLoginScreen),
                child: Text(
                  "လော့ဂ်အင်",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: kMediumFontSize14.sp),
                ),
              ),
            )
          ],
        );
      }
    );
  }
}
