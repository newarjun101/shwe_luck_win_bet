import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/default_values.dart';
import '../../../../core/local_ widget/custom_text_form_field.dart';

class BuildOtpCard extends StatelessWidget {
  BuildOtpCard({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Container(
      padding:  EdgeInsets.all(kDefaultMargin.sh),
      margin:  EdgeInsets.all(kDefaultMargin.sh),
      /*decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(4.h),
      ),*/
      child: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [



            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Expire in 6s",
                style: TextStyle(
                       color: Theme.of(context).colorScheme.primaryContainer,
                    fontSize: kMediumFontSize14.sp,),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),

            CustomTextFormField(
                controller: otpController,
                icon: Icons.phone_iphone_sharp,
                hint: "Otp",
                isPassword: false),

            SizedBox(
              height: kDefaultMargin.sh,
            ),

            MaterialButton(
              minWidth: double.infinity,
              height: 0.068.sh,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.h)
              ),

              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
               if(_key.currentState!.validate()){

                 print("success");
               }
              },
              child: Text(
                "Login",
                style: TextStyle(
               //     color: Theme.of(context).colorScheme.primaryContainer,
                    fontSize: kLargeFontSize16.sp,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
