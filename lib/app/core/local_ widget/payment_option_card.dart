import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwe_luck_win_bet/app/core/constants/default_values.dart';

class PaymentOptionCard extends StatelessWidget {

  final List<String> images;
  final String title;
 final VoidCallback onClick;
  const PaymentOptionCard({Key? key, required this.images, required this.title, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.23.sh,
      width: 0.43.sw,

      child: GestureDetector(
        onTap: onClick,
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      ClipRRect(
                          borderRadius: BorderRadius.circular(6.0.h),child: Image.asset(images[0],height: 0.08.sh,width: 0.08.sh,fit: BoxFit.cover,)),
                      SizedBox(width: 6.h,),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(6.0.h),child: Image.asset(images[1],height: 0.08.sh,width: 0.08.sh,fit: BoxFit.cover,)),
                    ]
                  ),
                  SizedBox(height: 6.h,),
                  Text( title,style: TextStyle(color: Theme.of(context).colorScheme.secondary,
                      fontSize: kLargeFontSize16.sp,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
