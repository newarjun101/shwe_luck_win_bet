import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';

customSnackBar({required String title,required IconData icon,bool? shouldIcon,required SnackPosition snackPosition,required Color bgColor,required Color iconColor}) {

  return   Get.showSnackbar(
      GetSnackBar(
        messageText: Text(title),
        icon:Icon(icon,color: iconColor,size: 30.0,),
        shouldIconPulse: false,
        backgroundColor: bgColor,
        barBlur: 40.0,
        snackPosition: snackPosition,
        margin:  EdgeInsets.all(kDefaultMargin.sh),
        padding: const EdgeInsets.all(20.0),
        borderRadius: 15.0,
        duration: const Duration(seconds: 3),
      )
  );
}