import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/custom_button.dart';
import 'package:shwe_luck_win_bet/app/core/validation/validation.dart';

import '../../../core/local_ widget/custom_text_form_field.dart';

class BuildCashOutScreenBody extends StatelessWidget {
  BuildCashOutScreenBody({Key? key}) : super(key: key);


 final TextEditingController userNameController = TextEditingController();
 final TextEditingController phoneController = TextEditingController();
 final TextEditingController transitionController = TextEditingController();
 final TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: kDefaultMargin.sh),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 0.1.sh,),
            CircleAvatar(
                radius: 60.h,
                backgroundColor: Theme.of(context).primaryColor,
                child: Center(
                    child: Icon(
                  Icons.paid_outlined,
                  size: 50.sp,
                  color: Theme.of(context).colorScheme.secondary,
                ))),

            SizedBox(
              height: kDefaultMargin.sh,
            ),
            Text("Cash In",style: TextStyle(color: Theme.of(context).colorScheme.primaryContainer,fontWeight: FontWeight.bold,fontSize: kMediumFontSize14.sp),),
            SizedBox(
              height: kDefaultMargin.sh,
            ),
            CustomTextFormField(
                controller: phoneController,
                icon: Icons.phone_in_talk_outlined,
                hint: "Phone Number",
              isPhone: true,
                validator: checkValidPhone,
                ),
            SizedBox(
              height: kDefaultMargin.sh,
            ),
            CustomTextFormField(
                controller: userNameController,
                icon: Icons.person_outlined,
                hint: "Account Name",
                validator: checkIsEmpty,
              ),
            SizedBox(
              height: kDefaultMargin.sh,
            ),
            CustomTextFormField(
                controller: transitionController,
                icon: Icons.receipt_long_outlined,
                hint: "Transition",
                validator: checkByLength,
              isPhone: true,
               ),
            SizedBox(
              height: kDefaultMargin.sh,
            ),
            CustomTextFormField(
                controller: amountController,
                icon: Icons.paid_outlined,
                hint: "Amount",
                validator: checkByLength,
              isPhone: true,
                ),
            SizedBox(
              height: kDefaultMargin.sh*2,
            ),
            SizedBox(
              height: 0.07.sh,
              child: CustomButton(onClick: ()=> print("Hello World"), title: "Cash In",
                  bgColor: Theme.of(context).colorScheme.secondary,
                  textColor: Theme.of(context).colorScheme.onPrimary, radius: 4, iconSize: 24, isIcon: false),
            )
          ],
        ),
      ),
    );
  }
}
