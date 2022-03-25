import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/local_%20widget/quick_bet_button_row.dart';

import '../../../core/constants/default_values.dart';
import '../../../core/local_ widget/button_quick_bet.dart';
import '../../../core/local_ widget/custom_button.dart';

void quickBettingBottomSheet({required BuildContext context,required Widget child,required double height}) {
  showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0.05.sh),
          topRight: Radius.circular(0.05.sh)),
    ),
    context: context,
    builder: (context) {
      return SizedBox(
          width: double.infinity,
          height: height.sh,
          child: Padding(
            padding: EdgeInsets.only(left: kDefaultMargin.sh,right: kDefaultMargin.sh,top: kDefaultMargin.sh,),
            child: child,
          ));
    },
  );
}



