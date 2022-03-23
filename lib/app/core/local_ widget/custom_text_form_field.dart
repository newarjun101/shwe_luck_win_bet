import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/extension/extension_form_validate.dart';
import '../constants/default_values.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hint;
  final bool? isPassword;
  final bool? isIcon;
  final String? Function(String?)? validator;
  final bool? isPhone;
  final Color? bgColor;
  final Color? textColor;

  const CustomTextFormField(
      {Key? key,
      required this.controller,
      required this.icon,
      required this.hint,
      this.isPhone,
       this.isPassword,
      this.isIcon, this.validator, this.bgColor, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.w),
          color: bgColor??Theme.of(context).primaryColor),
      child: TextFormField(
        obscureText: isPassword ??false,
        controller: controller,
        keyboardType:
            isPhone ?? false ? TextInputType.number : TextInputType.text,
        style: TextStyle(
          fontSize: kMediumFontSize14.sp,
          color:textColor?? Theme.of(context).colorScheme.primaryContainer,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          focusColor:bgColor?? Theme.of(context).colorScheme.primaryContainer,
          contentPadding: EdgeInsets.fromLTRB(0.03.sh, 0.01.sh, 0.01.sh, 0),
          //add prefix icon
          prefixIcon: Icon(icon,
              size: 20.sp,
              color: textColor??Theme.of(context).colorScheme.primaryContainer),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.w)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSecondary, width: 1.0),
            borderRadius: BorderRadius.circular(4.w),
          ),
          fillColor: bgColor??Theme.of(context).colorScheme.primaryContainer,

          hintText: hint,
          //make hint text
          hintStyle: TextStyle(
            color: textColor??Theme.of(context).colorScheme.primaryContainer,
            fontSize: kMediumFontSize14.sp,
            fontFamily: "verdana_regular",
            fontWeight: FontWeight.w400,
          ),
        ),
        validator:validator,
      ),
    );
  }
}
