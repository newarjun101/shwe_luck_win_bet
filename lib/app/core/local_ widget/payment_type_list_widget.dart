import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/module/controller/cash_in_cash_out_screen_controller.dart';

import '../constants/default_values.dart';

class PaymentTypeListWidget extends StatelessWidget {
  PaymentTypeListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Select Payment Type",
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: kMediumFontSize14.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: kDefaultMargin.sh,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, postion) {
              return SizedBox(
                width: 0.21.sh,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                   //   margin: EdgeInsets.symmetric(horizontal: kDefaultMargin.sw),
                      padding: EdgeInsets.all(4.w),
                      width: 0.18.sh,
                      height: 0.18.sh,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.onPrimary,
                            width: 0.6),
                        borderRadius: BorderRadius.circular(4.h),

                      ),

                      child: CachedNetworkImage(
                        imageUrl:
                            "https://cdn.pixabay.com/photo/2013/12/08/12/12/bitcoin-225080_960_720.png",
                        imageBuilder: (context, imageProvider) => Container(

                        /*  width: 0.2.sh,
                          height: 0.2.sh,*/
                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(4.h),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.contain),
                          ),
                        ),
                        placeholder: (context, url) =>
                         const   CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    SizedBox(
                      height: kDefaultMargin.sh,
                    ),
                    Text(
                      "K B Z Pay",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: kMediumFontSize14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
            /*  ClipRRect(
                borderRadius: BorderRadius.circular(6.0.h),child: Image.asset(images[0],height: 0.08.sh,width: 0.08.sh,fit: BoxFit.cover,)),
            SizedBox(height: 6.h,),
            Text( "Select Payment Type",style: TextStyle(color: Theme.of(context).colorScheme.secondary,
                fontSize: kLargeFontSize16.sp,fontWeight: FontWeight.bold),),*/
          ))
        ],
      ),
    );
  }
}
