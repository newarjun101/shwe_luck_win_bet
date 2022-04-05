import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';

customDialog(context, String title, Widget child) {
  return showDialog(
      context: context,

      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,

          title: Center(child: Text(title,style: TextStyle(fontSize: kLargeFontSize16.sp,fontWeight: FontWeight.bold),)),
          content: child,
        );
      }
  );
}
