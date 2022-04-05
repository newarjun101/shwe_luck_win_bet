import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/custom_button.dart';
import 'package:shwe_luck_win_bet/app/core/validation/validation.dart';
import 'package:shwe_luck_win_bet/app/module/controller/cash_in_cash_out_screen_controller.dart';

import '../../../core/local_ widget/custom_text_form_field.dart';

class BuildCashOutScreenBody extends StatelessWidget {
  BuildCashOutScreenBody({Key? key}) : super(key: key);

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController transitionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final paymentController = Get.find<CashInCashOutScreenController>();
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: kDefaultMargin.sh),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 0.1.sh,
            ),
            CircleAvatar(
              radius: 60.h,
              backgroundColor: Theme.of(context).primaryColor,
              child: Center(
                child:Obx(()=>  paymentController.isPaymentSelected.isFalse ? Icon(
                  Icons.paid_outlined,
                  size: 50.sp,
                  color: Theme.of(context).colorScheme.secondary,
                ) : Text(paymentController.mPaymentList[paymentController.mSelectedPaymentIndex].name)
                ),
              ),
            ),
            SizedBox(
              height: kDefaultMargin.sh,
            ),
            Text(
              "Cash Out",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  fontWeight: FontWeight.bold,
                  fontSize: kMediumFontSize14.sp),
            ),
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
              controller: amountController,
              icon: Icons.paid_outlined,
              hint: "Amount",
              validator: checkByLength,
              isPhone: true,
            ),
            SizedBox(
              height: kDefaultMargin.sh * 2,
            ),
            SizedBox(
              height: 0.07.sh,
              width: 0.5.sw,
              child: CustomButton(
                  onClick: () =>
                      paymentController.showPaymentTypeWidget(context),
                  title: "Payment Type",
                  bgColor: Theme.of(context).colorScheme.primaryContainer,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  radius: 4,
                  iconSize: 24,
                  isIcon: false),
            ),
            SizedBox(
              height: kDefaultMargin.sh * 2,
            ),
            SizedBox(
              height: 0.07.sh,
              child: CustomButton(
                  onClick: () {
                    paymentController.cashOutRequest(
                        context: context,
                        name: userNameController.text,
                        phone: phoneController.text,
                        amount: int.parse(amountController.text));

                    userNameController.clear();
                    transitionController.clear();
                    phoneController.clear();
                    amountController.clear();
                  },
                  title: "Cash Out",
                  bgColor: Theme.of(context).colorScheme.secondary,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  radius: 4,
                  iconSize: 24,
                  isIcon: false),
            ),
          ],
        ),
      ),
    );
  }
}
