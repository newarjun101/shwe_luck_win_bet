import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/default_values.dart';
import '../../../../core/local_ widget/custom_text_form_field.dart';

class BuildLoginCard extends StatelessWidget {
  BuildLoginCard({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
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
            CustomTextFormField(
                controller: userNameController,
                icon: Icons.account_circle,
                hint: "phone number",
                isPassword: false),
            SizedBox(
              height: kDefaultMargin.sh,
            ),
            CustomTextFormField(
                controller: passwordController,
                icon: Icons.visibility_off,
                hint: "password",
                isPassword: true),

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

                 print("error");
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
