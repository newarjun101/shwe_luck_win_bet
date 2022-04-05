import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/custom_button.dart';

import '../validation/validation.dart';
import 'custom_text_form_field.dart';

class DialogChildWithTextFormField extends StatelessWidget {

  final TextEditingController textController;
  final String hint;
  final String buttonText;
  final VoidCallback onPress;

   DialogChildWithTextFormField({Key? key, required this.textController, required this.hint, required this.buttonText, required this.onPress}) : super(key: key);

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 0.2.sh,
      child: Form(
        key: _key,
        child: Column(

          children: [
            SizedBox(
              width: 0.33.sw,
              height: 0.056.sh,
              child: CustomTextFormField(
                  controller: textController,
                  icon: Icons.paid,
                  hint: hint,
                  bgColor: Theme.of(context).colorScheme.primaryContainer,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  validator: checkIsEmpty,
                  isPhone: true,
                  isPassword: false),
            ),

            CustomButton(onClick: onPress, title: "title", bgColor: Colors.red, textColor: Colors.white, radius: 2, iconSize: 24, isIcon: false)
          ],
        ),
      ),
    );

  }
}
