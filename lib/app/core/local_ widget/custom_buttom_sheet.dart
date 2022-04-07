import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/default_values.dart';


void customBottomSheet({required BuildContext context,required Widget child,required double height}) {
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



