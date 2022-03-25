import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/module/controller/cash_in_cash_out_screen_controller.dart';

import '../constants/default_values.dart';

class PaymentTypeListWidget extends StatelessWidget {
  PaymentTypeListWidget({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.23.sh,
      width: 0.43.sw,

      child: Card(

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.h)
        ),
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding:  EdgeInsets.all(kDefaultMargin.sh*1.5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center ,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text( "Select Payment Type",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: kMediumFontSize14.sp,fontWeight: FontWeight.bold),),
                SizedBox(height: kDefaultMargin.sh,),

              Expanded(
                child: ListView.builder(

                  itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,postion) {

                    return Text("hello World");
                },
                /*  ClipRRect(
                      borderRadius: BorderRadius.circular(6.0.h),child: Image.asset(images[0],height: 0.08.sh,width: 0.08.sh,fit: BoxFit.cover,)),
                  SizedBox(height: 6.h,),
                  Text( "Select Payment Type",style: TextStyle(color: Theme.of(context).colorScheme.secondary,
                      fontSize: kLargeFontSize16.sp,fontWeight: FontWeight.bold),),*/

                )
              )],
            ),
          ),
        ),
      ),
    );
  }
}
