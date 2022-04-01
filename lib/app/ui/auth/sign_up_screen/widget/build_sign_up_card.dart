import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/custom_dialog.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';
import 'package:shwe_luck_win_bet/app/core/validation/validation.dart';
import 'package:shwe_luck_win_bet/app/module/controller/sign_up_screen_controller.dart';
import '../../../../core/constants/default_values.dart';
import '../../../../core/local_ widget/custom_button.dart';
import '../../../../core/local_ widget/custom_text_form_field.dart';

class BuildSignUpCard extends StatelessWidget {
  BuildSignUpCard({Key? key}) : super(key: key);
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
            CustomTextFormField(
                controller: userNameController,
                icon: Icons.account_circle_outlined,
                hint: "first name",
                validator: checkIsEmpty,
                isPassword: false),
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
            SizedBox(
              height: 0.06.sh,
              child: CustomButton(
                  onClick: () {

                    if(signUpController.imageFile !=null && passwordController.text==confirmController.text) {
                      signUpController.registerConfirm(password: passwordController.text, name: userNameController.text, context: context);
                    } else {
                      customDialog(context, "Image Can't be Empty", Text("Image Null"));
                    }

                  },
                  title: "Create Account",
                  bgColor: Theme.of(context).colorScheme.secondary,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  radius: 4,
                  iconSize: 20,
                  isIcon: false),
            )
          ],
        ),
      ),
    );
  }
}
