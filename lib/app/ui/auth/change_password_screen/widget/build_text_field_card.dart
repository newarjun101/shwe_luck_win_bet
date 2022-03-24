import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';
import 'package:shwe_luck_win_bet/app/core/validation/validation.dart';
import 'package:shwe_luck_win_bet/app/module/controller/sign_up_screen_controller.dart';

import '../../../../core/constants/default_values.dart';
import '../../../../core/local_ widget/custom_text_form_field.dart';

class BuildTextFieldCard extends StatelessWidget {
  BuildTextFieldCard({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey();

  final signUpController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController otpController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmController = TextEditingController();
    return Container(
      padding: EdgeInsets.all(kDefaultMargin.sh),
      margin: EdgeInsets.all(kDefaultMargin.sh),
      /*decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(4.h),
      ),*/
      child: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomTextFormField(
                      controller: userNameController,
                      icon: Icons.account_circle_outlined,
                      hint: "first name",
                      validator: checkIsEmpty,
                      isPassword: false),
                ),
                SizedBox(
                  width: kDefaultMargin.sh,
                ),
                Expanded(
                  flex: 1,
                  child: CustomTextFormField(
                      controller: phoneController,
                      icon: Icons.phone_iphone_sharp,
                      hint: "phone",
                      validator: checkValidPhone,
                      isPhone: true,
                      isPassword: false),
                ),
              ],
            ),
            SizedBox(
              height: kDefaultMargin.sh,
            ),
            CustomTextFormField(
                controller: passwordController,
                icon: Icons.visibility_off,
                hint: "password",
                validator: checkByLength,
                isPassword: true),
            SizedBox(
              height: kDefaultMargin.sh,
            ),
            CustomTextFormField(
                controller: confirmController,
                icon: Icons.visibility_off,
                hint: "confirm password",
                validator: checkByLength,
                isPassword: true),
            SizedBox(
              height: kDefaultMargin.sh,
            ),
            CustomTextFormField(
                controller: otpController,
                icon: Icons.phone_locked_outlined,
                hint: "Otp Code",
                isPhone: true,
                validator: checkByLength,
                isPassword: true),
            SizedBox(
              height: kDefaultMargin.sh,
            ),
            MaterialButton(
              minWidth: double.infinity,
              height: 0.068.sh,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.h)),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
            //    signUpController.getFromGallery();
                if (_key.currentState!.validate()) {
                  Get.toNamed(Pages.lOtp);


                }
              },
              child: Text(
                "အကောင့်အသစ်ဖွင့်မည်",
                style: TextStyle(
                    //     color: Theme.of(context).colorScheme.primaryContainer,
                    fontSize: kLargeFontSize16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
