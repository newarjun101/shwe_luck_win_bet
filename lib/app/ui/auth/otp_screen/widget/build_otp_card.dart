import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/custom_button.dart';
import 'package:shwe_luck_win_bet/app/core/route/pages.dart';
import 'package:shwe_luck_win_bet/app/core/validation/validation.dart';
import 'package:shwe_luck_win_bet/app/module/controller/sign_up_screen_controller.dart';

import '../../../../core/constants/default_values.dart';
import '../../../../core/local_ widget/custom_text_form_field.dart';

class BuildOtpCard extends StatelessWidget {
  BuildOtpCard({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    final signUpController = Get.find<SignUpScreenController>();
    return Container(
      padding: EdgeInsets.all(kDefaultMargin.sh),
      margin: EdgeInsets.all(kDefaultMargin.sh),
      /*decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(4.h),
      ),*/
      child: Form(
        key: _key,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Flexible(
                    child: CustomTextFormField(
                        controller: phoneController,
                        icon: Icons.phone_iphone_sharp,
                        hint: "Phone Number",
                        isPhone: true,
                        validator: checkValidPhone,
                        isPassword: false),
                  ),
                  SizedBox(
                    width: kDefaultMargin.sw,
                  ),
                  CustomButton(
                      onClick: () {
                        if (_key.currentState!.validate()) {
                          signUpController.getOtp(
                              phone: phoneController.text, context: context);
                        }
                      },
                      title: "Get Otp",
                      bgColor: Theme.of(context).colorScheme.secondary,
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      radius: 4,
                      iconSize: 20,
                      isIcon: false)
                ],
              ),
              SizedBox(
                height: kDefaultMargin.sh * 2,
              ),
              signUpController.isOtp.isTrue
                  ? CustomTextFormField(
                      controller: otpController,
                      icon: Icons.phone_iphone_sharp,
                      hint: "Otp",
                      isPassword: false)
                  : Text(signUpController.errorMessage.toString(),style: TextStyle(color: Theme.of(context).colorScheme.primaryContainer),),
              SizedBox(
                height: kDefaultMargin.sh,
              ),
              signUpController.isOtp.isTrue
                  ? SizedBox(
                      height: 0.06.sh,
                      child: CustomButton(
                          onClick: () {
                            if (_key.currentState!.validate()) {
                              signUpController.confirmOtp(
                                  otpCode: otpController.text,
                                  context: context);
                            }
                          },
                          title: "Confirm Otp",
                          bgColor: Theme.of(context).colorScheme.secondary,
                          textColor: Theme.of(context).colorScheme.onPrimary,
                          radius: 4,
                          iconSize: 20,
                          isIcon: false),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
