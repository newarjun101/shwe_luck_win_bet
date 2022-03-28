import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/extension/extension_form_validate.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/custom_dialog.dart';
import 'package:shwe_luck_win_bet/app/module/controller/login_screen_controller.dart';
import '../../../../core/constants/default_values.dart';
import '../../../../core/local_ widget/custom_text_form_field.dart';
import '../../../../core/route/pages.dart';
import '../../../../core/validation/validation.dart';

class BuildLoginCard extends StatelessWidget {
  BuildLoginCard({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey();

  final loginController = Get.find<LoginScreenController>();

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                icon: Icons.account_circle,
                hint: "ဖုန်းနံပါတ်",
                validator: checkValidPhone,
                isPhone: true,
                isPassword: false),
            SizedBox(
              height: kDefaultMargin.sh,
            ),
            CustomTextFormField(
                controller: passwordController,
                icon: Icons.visibility_off,
                hint: "လျှိဝှက်နံပါတ်",
                validator: checkIsEmpty,
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
                loginController.login(
                    phone: userNameController.text,
                    password: passwordController.text,context: context);
               /* if (_key.currentState!.validate()) {

                  customDialog(
                      context,
                      "Loading",
                      const SizedBox(
                          width: 10,
                          height: 20,
                          child: Center(child: CircularProgressIndicator())));


                  Get.back();
                  // Get.toNamed(Pages.lOtp);
                }*/
              },
              child: Text(
                "လော့အင်ဝင်မည်",
                style: TextStyle(
                    //     color: Theme.of(context).colorScheme.primaryContainer,
                    fontSize: kLargeFontSize16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
