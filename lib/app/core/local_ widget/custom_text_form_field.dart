import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/default_values.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hint;
  final bool isPassword;

  const CustomTextFormField(
      {Key? key,
        required this.controller,
        required this.icon,
        required this.hint,
        required this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(4.w),
          color: Theme.of(context).primaryColor
      ),
      child: TextFormField(
        obscureText: isPassword?true: false,
        controller: controller,
        //  keyboardType: isPassword?TextInputType.visiblePassword : TextInputType.text ,
        style: TextStyle(
          fontSize: kMediumFontSize14.sp,
          color: Theme.of(context).colorScheme.primaryContainer,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          focusColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(0.03.sh, 0.01.sh, 0.01.sh, 0),
          //add prefix icon
          prefixIcon: Icon(
            icon,
              size: 20.sp,
              color: Theme.of(context).colorScheme.primaryContainer
          ),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(4.w)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSecondary,
                width: 1.0),
            borderRadius: BorderRadius.circular(4.w),
          ),
          fillColor: Colors.white,

          hintText: hint,
          //make hint text
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primaryContainer,
            fontSize: kMediumFontSize14.sp,
            fontFamily: "verdana_regular",
            fontWeight: FontWeight.w400,
          ),
        ),
        validator: (value) {
          if (value== null || value=='') {
            return "Error";
          }
        },
      ),
    );
  }
}