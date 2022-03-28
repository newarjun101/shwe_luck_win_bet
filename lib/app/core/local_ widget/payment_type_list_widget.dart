import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shwe_luck_win_bet/app/core/constants/api_consts.dart';
import 'package:shwe_luck_win_bet/app/module/controller/cash_in_cash_out_screen_controller.dart';

import '../constants/default_values.dart';

class PaymentTypeListWidget extends StatelessWidget {
  const PaymentTypeListWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CashInCashOutScreenController>();
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
              child: Obx(
                ()=>  controller.mPaymentList.isEmpty? CircularProgressIndicator() :  ListView.builder(
            itemCount: controller.mPaymentList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, postion) {
                return SizedBox(
                  width: 0.21.sh,
                  child: GestureDetector(
                    onTap: ()=> controller.selectPaymentType(postion),
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
                                "http://167.172.73.241/"+controller.mPaymentList[postion].logo.toString(),
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
                          controller.mPaymentList[postion].name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: kMediumFontSize14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
            },

          ),
              ))
        ],
      ),
    );
  }
}
